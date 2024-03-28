local dotnet = os.getenv("NEOVIM_DOTNET") or "old" -- old / new

vim.o.mouse = ""

if dotnet == "old" then
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        setup = {
          omnisharp = function(_, opts)
            return true -- return true if you don't want this server to be setup with lspconfig
          end,
        },
      },
    },
  }
else
  return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        setup = {
          omnisharp_mono = function(_, opts)
            return true -- return true if you don't want this server to be setup with lspconfig
          end,
        },
      },
    },
  }
end
