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
       },
hypr: #{
targets: "~/.config/hypr",
         enabled:true,
      },
waybar: #{
targets: "~/.config/waybar",
         enabled:true,
        },
fish: #{
targets: "~/.config/fish",
         enabled:true,
      },
nvim: #{
targets: "~/.config/nvim",
         enabled:true,
      },
kitty: #{
targets: "~/.config/kitty",
         enabled:true,
       },
zsh: #{
    targets: #{
        ".zshrc":"~/.zshrc",
        ".zshenv":"~/.zshenv",
      },
    main_file: ".zshrc",
  },
};
