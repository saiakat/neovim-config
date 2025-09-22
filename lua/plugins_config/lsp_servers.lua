local M={}

local configs = {
  pyright={
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly",
          useLibraryCodeForTypes = true
        }
      }
    }
  },
  clangd = {
    cmd = { "clangd", "--background-index" }
  },
  ts_ls = {
    settings = {
      codeActionOnSave = {
        enable = true,
        source = {
          organizeImports = true,
        },
      },
      TypeScript = {
        tsconfig = "tsconfig.json",
      }
    }
  },
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    }
  },
}

M.servers = {
  pyright={hasconfig=true, config={}},
  lua_ls={hasconfig=true, config={}},
  yamlls={hasconfig=false, config={}},
  ts_ls={hasconfig=true, config={}},
  html={hasconfig=false, config={}},
  cssls={hasconfig=false, config={}},
  jsonls={hasconfig=false, config={}},
  clangd={hasconfig=true, config={}},
  bashls={hasconfig=false, config={}},
  gopls={hasconfig=false, config={}},
  eslint={hasconfig=false, config={}},
  java_language_server={hasconfig=false, config={}},
}

M.names = {
  "pyright",
  "lua_ls",
  "yamlls",
  "ts_ls",
  "html",
  "cssls",
  "jsonls",
  "clangd",
  "bashls",
  "gopls",
  "eslint",
  "java_language_server",
}

for k,v in pairs(M.servers) do
  if v.hasconfig == true then
    v.config = configs[k]
  end
end

return M
