return {
  {
    -- JSON syntax and config
    "elzr/vim-json",
    init = function()
      vim.g.vim_json_syntax_conceal = 0
    end,
  },
  {
    -- React JSX syntax
    "maxmellon/vim-jsx-pretty",
    init = function()
      vim.g.vim_jsx_pretty_disable_tsx = 1 -- handled by peitalin/vim-jsx-typescript
    end,
  },
  "pangloss/vim-javascript", -- JavaScript/ES6 syntax
  "leafgarland/typescript-vim", -- TypeScript syntax
  "prisma/vim-prisma", -- Prisma syntax
  "posva/vim-vue", -- Vue SFC syntax
  "mustache/vim-mustache-handlebars", -- handlebars syntax
  "peitalin/vim-jsx-typescript", -- TypeScript JSX syntax
  "styled-components/vim-styled-components", -- Emotion syntax
  "jparise/vim-graphql", -- GraphQL syntax
}
