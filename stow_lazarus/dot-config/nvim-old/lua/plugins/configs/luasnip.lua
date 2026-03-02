local ls = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()

ls.config.set_config({
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
})


--
-- Snippets
--
--
-- some shorthands...
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

-- Clean snippets table when reloading this file
ls.cleanup()


-- Helper function for TeX snippets
local function asciify(args, _)
    return string.gsub(string.lower(args[1][1]), '%W', '_')
end

ls.add_snippets("tex", {
        s({trig="^", wordTrig=false}, { t("^{"), i(1), t("}"), i(0) } ),
        s({trig="_", wordTrig=false}, { t("_{"), i(1), t("}"), i(0) } ),

        -- System with only one equation number
        s({trig="\\eqaligned", wordTrig=false},
          {
            t({"\\begin{equation}", "\t\\left\\{\\begin{aligned}", "\t\t&"}),
            i(1 , "your stuff here"),
            t({"","\t\\end{aligned}\\right.", "\\end{equation}", ""}),
            i(0)
          })
}, {type = "snippets", key = "tex_snippets"})

ls.add_snippets("tex", {
        s({trig="^^", wordTrig = false}, { t("^{("), i(1), t(")}"), i(0) } ),
        s({trig="__", wordTrig = false}, { t("_{("), i(1), t(")}"), i(0) } ),

        -- TeX math fonts
        s({trig="mbb", wordTrig = false}, {t("\\mathbb{"), i(1), t("}"), i(0)}),
        s({trig="mcal", wordTrig = false}, {t("\\mathcal{"), i(1), t("}"), i(0)}),

        -- TeX modifiers
        s({trig="tld", wordTrig = false}, {t("\\tilde{"), i(1), t("}"), i(0)}),

        -- Fractions and binaries
        s({trig="\\frac", wordTrig = false},
          {t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0)}),


        -- Sum and integral maybe
        s({trig="\\sum", wordTrig = false},
          {t("\\sum_{"), i(1), t("}"), i(0)}),

        }, 

        {type = "autosnippets", key = "tex_auto"})


-- require('luasnip.loaders.from_vscode').lazy_load({ paths = {'lua/config/} })

