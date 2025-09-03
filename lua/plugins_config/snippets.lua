local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require("luasnip.extras")
local rep = extras.rep
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

ls.add_snippets("lua", {
    s("if", {
        t('if '),
        i(1, "true"),
        t(' then '),
        i(2),
        t(' end')
    })
})

ls.add_snippets("javascriptreact", {
  s("it", fmt([[
    it('{}', () => {{
    }});
    ]], {i(1)})),

  s("db", fmt([[
    describe('{}', () => {{
    }});
    ]], {i(1)})),

  s("cofu", fmt([[
    const {} = () => {{
    }};
    ]], {i(1)})),

  s("bfa", fmt([[
    beforeAll(() => {{
      {}
    }});
    ]], {i(1)})),
})

