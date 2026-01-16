import { $ } from "bun";

const nixChannel = "unstable";

const priorityBrowsers = ["zen-twilight", "helium"];

const findBrowser = async () => {
    const windows = (await $`niri msg --json windows`).json() as Array<{ app_id: string; id: string; }>;
    
    for (const window of windows) {
        if (priorityBrowsers.includes(window.app_id)) return window.id;
    }

    return undefined;
};

const onSearch = async () => {
    const fuzzelInput: string = (await $`fuzzel --lines 0 --prompt "search: " --dmenu`).text().trimEnd();

	let url: string;
    if (fuzzelInput.startsWith("!nix")) {
        const query = encodeURIComponent(fuzzelInput.replace("!nix ", "").trim());
		url = `https://search.nixos.org/packages?channel=${nixChannel}&from=0&size=50&sort=relevance&type=packages&query=${query}`;
    } else if (fuzzelInput.startsWith("!home")) {
        const query = encodeURIComponent(fuzzelInput.replace("!hm ", "").trim());
		url = `https://home-manager-options.extranix.com/?query=${query}&release=release-25.11`;
	} else if (fuzzelInput.startsWith("!gh")) {
		let remainingFuzzelInput = fuzzelInput.replace("!gh ", "").trim();
		let extensionSuffix = "";

		if (fuzzelInput.includes("e:")) {
			const extensionQuery = remainingFuzzelInput
				.split(" ")
				.find((word) => word.startsWith("e:")) ?? '';

			remainingFuzzelInput = remainingFuzzelInput.replace(extensionQuery, "");
			extensionSuffix = `+path%3A*.${extensionQuery.substring(2)}`;
		}

		url = `https://github.com/search?q=%22${encodeURIComponent(remainingFuzzelInput)}%22${encodeURIComponent(extensionSuffix)}&type=code`;
	} else {
		url = `https://www.google.com/search?q=${encodeURIComponent(fuzzelInput)}`;
	}

	const browserId = await findBrowser();

	await Promise.all([
		$`niri msg action focus-window --id=${browserId}`,
		$`xdg-open "${url}"`
	]);
};

onSearch().catch((error) => {
  console.error(error);
  process.exit(1);
});
