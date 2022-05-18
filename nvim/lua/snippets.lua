local ls = require("luasnip")

local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

-- ls.parser.parse_snippet(<text>, <VS**** style snippet>)
ls.add_snippets(nil, {
	python = {
		snip({
			trig = 'todo',
			name = 'Todo',
			dscr = 'Todo Comment',
		}, {
			text({'# TODO: '}), insert(1, 'task'),
		}),
		snip({
			trig = 'note',
			name = 'Note',
			dscr = 'Note Comment',
		}, {
			text({'# NOTE: '}), insert(1, 'note'),
		}),
		snip({
			trig = 'fix',
			name = 'Fix',
			dscr = 'Fix Comment',
		}, {
			text({'# FIX: '}), insert(1, 'fix'),
		}),
		snip({
			trig = 'hack',
			name = 'Hack',
			dscr = 'Hack Comment',
		}, {
			text({'# HACK: '}), insert(1, 'hack'),
		}),
		snip({
			trig = 'print',
			name = 'Print Function',
			dscr = 'Make the print function easier',
		}, {
			text({'print("'}), insert(1, 'text'), text({'")'})
		})
	},
})
