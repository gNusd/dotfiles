:lua << EOF

local servers = {
  {name = 'bashls'},
  {name = 'vimls'},
  {name = 'pyls'},
  {name = 'rust_analyzer'},
  {
    name = 'rls',
    config = {
      settings = {
        rust = {
          clippy_preference = 'on'
        }
      },
    }
  },
  {
    name = 'sumneko_lua',
    config = {
      settings = {
        Lua = {
          runtime={
            version="LuaJIT",
          },
          diagnostics={
            enable=true,
            globals={"vim", "spoon", "hs"},
          },
        }
      },
    }
  },
  -- YAML schemas http://schemastore.org/json/
  {
    name = 'yamlls',
    config = {
      settings = {
        yaml = {
          schemas = {
            ['http://json.schemastore.org/github-workflow'] = '.github/workflows/*.{yml,yaml}',
            ['http://json.schemastore.org/github-action'] = '.github/action.{yml,yaml}',
            ['http://json.schemastore.org/ansible-stable-2.9'] = 'roles/tasks/*.{yml,yaml}',
            ['http://json.schemastore.org/prettierrc'] = '.prettierrc.{yml,yaml}',
            ['http://json.schemastore.org/stylelintrc'] = '.stylelintrc.{yml,yaml}',
            ['http://json.schemastore.org/circleciconfig'] = '.circleci/**/*.{yml,yaml}'
          }
        }
      },
    }
  },
}

for _, lsp in ipairs(servers) do
  if lsp.config then
    lsp.config.on_attach = on_attach
  else
    lsp.config = {
      on_attach = on_attach
    }
  end

  nvim_lsp[lsp.name].setup(lsp.config)
end
EOF
" Use LSP omni-completion
autocmd Filetype rust setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype sh setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype vim setlocal omnifunc=v:lua.vim.lsp.omnifunc
autocmd Filetype yaml setlocal omnifunc=v:lua.vim.lsp.omnifunc
