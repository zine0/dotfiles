export let data = #{
for_vcs: LOCAL,
           cool_setting: if SYSTEM.hostname == "foo" { 10 } else { 25 }
};
export let eggs = #{
alacritty: #{
targets: "~/.config/alacritty",
           templates:["alacritty.yml"],
           enabled:false,
           },
helix: #{
targets: "~/.config/helix",
         enabled:false,
       },
hypr: #{
targets: "~/.config/hypr",
         enabled:false,
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
         enabled:false,
       },
zsh: #{
    targets: #{
        ".zshrc":"~/.zshrc",
        ".zshenv":"~/.zshenv",
      },
    main_file: ".zshrc",
    enabled:false,
  },
ghostty: #{
targets: "~/.config/ghostty",
         enabled:true,
       },
fuzzel: #{
targets: "~/.config/fuzzel",
         enabled:true,
       },
git: #{
    targets: #{
        "gitconfig":"~/.gitconfig",
    },
    enabled:true,
},
scripts: #{
    targets:  "~/scripts",
    enabled:true,
},
niri: #{
    targets: "~/.config/niri",
    enabled:true,
},
};
