return {
  jsonls = {
    settings = {
      json = {
        schema = require("schemastore").json.schemas(),
        validate = { enable = true },
      },
    },
  },
    lua_ls = {
                -- enabled = false,
                single_file_support = true,
                settings = {
                    Lua = {
                        workspace = {
                            checkThirdParty = false,
                        },
                        completion = {
                            workspaceWord = true,
                            callSnippet = "Both",
                        },
                        misc = {
                            parameters = {
                                -- "--log-level=trace",
                            },
                        },
                        hint = {
                            enable = true,
                            setType = false,
                            paramType = true,
                            paramName = "Disable",
                            semicolon = "Disable",
                            arrayIndex = "Disable",
                        },
                        doc = {
                            privateName = { "^_" },
                        },
                        type = {
                            castNumberToInteger = true,
                        },
                        diagnostics = {
                            disable = { "incomplete-signature-doc", "trailing-space" },
                            -- enable = false,
                            groupSeverity = {
                                strong = "Warning",
                                strict = "Warning",
                            },
                            groupFileStatus = {
                                ["ambiguity"] = "Opened",
                                ["await"] = "Opened",
                                ["codestyle"] = "None",
                                ["duplicate"] = "Opened",
                                ["global"] = "Opened",
                                ["luadoc"] = "Opened",
                                ["redefined"] = "Opened",
                                ["strict"] = "Opened",
                                ["strong"] = "Opened",
                                ["type-check"] = "Opened",
                                ["unbalanced"] = "Opened",
                                ["unused"] = "Opened",
                            },
                            unusedLocalExclude = { "_*" },
                        },
                        format = {
                            enable = false,
                            defaultConfig = {
                                indent_style = "space",
                                indent_size = "2",
                                continuation_indent_size = "2",
                            },
                        },
                    },
                },
            },
  bashls = {
    filetypes = { "sh", "zsh" },
  },
  vimls = {
    filetypes = { "vim" },
  },
}