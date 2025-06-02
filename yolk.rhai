export let data = #{
    for_vcs: LOCAL,
    cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
export let eggs = #{
    alacritty: #{
        targets: "~/.config/alacritty",
        templates:["alacritty.yml"],
        enabled:true,
    },
        helix: #{
        targets: "~/.config/helix",
        enabled:true,
    }
};
