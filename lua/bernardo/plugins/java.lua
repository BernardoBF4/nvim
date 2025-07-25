return {
  {
    'nvim-java/nvim-java',

    -- 1. Dependências:
    -- Apenas declaramos o que o 'nvim-java' precisa para funcionar.
    -- O lazy.nvim garante que eles sejam carregados, mas a configuração
    -- deles (como os atalhos do 'dap') fica nos seus arquivos dedicados.
    dependencies = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
    },

    config = function()
      require('java').setup()
      -- 3. A "Ponte" para o seu Mason/LSP:
      -- Esta é a linha mais importante. Ela diz ao 'nvim-lspconfig'
      -- (que é usado pelo seu 'mason-lspconfig') para usar a configuração
      -- que o 'nvim-java' preparou para o 'jdtls'.
      require('lspconfig').jdtls.setup({})
    end,
  },
}
