local ls = require("luasnip")

local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

-- ls.parser.parse_snippet(<text>, <VS**** style snippet>)
ls.add_snippets(nil, {
	all = {
		snip({
			trig = 'todo',
			name = 'Todo',
			dscr = 'Todo Comment',
		}, {
			text({'TODO: '}), insert(1, 'task'),
		}),
		snip({
			trig = 'inprogress',
			name = 'Progress',
			dscr = 'In Progress',
		}, {
			text({'INPROGRESS: '}), insert(1, 'task'),
		}),
		snip({
			trig = 'note',
			name = 'Note',
			dscr = 'Note Comment',
		}, {
			text({'NOTE: '}), insert(1, 'note'),
		}),
		snip({
			trig = 'fix',
			name = 'Fix',
			dscr = 'Fix Comment',
		}, {
			text({'FIX: '}), insert(1, 'fix'),
		}),
		snip({
			trig = 'hack',
			name = 'Hack',
			dscr = 'Hack Comment',
		}, {
			text({'HACK: '}), insert(1, 'hack'),
		}),
		snip({
			trig = 'question',
			name = 'Question',
			dscr = 'Question',
		}, {
			text({'QUESTION: '}), insert(1, 'question'),
		}),
		snip({
			trig = 'caveat',
			name = 'Caveat',
			dscr = 'Caveat',
		}, {
			text({'CAVEAT: '}), insert(1, 'caveat'),
		}),
	},
	python = {
		snip({
			trig = 'print',
			name = 'Print Function',
			dscr = 'Make the print function easier',
		}, {
			text({'print("'}), insert(1, 'text'), text({'")'})
		}),
		snip({
			trig = 'doc',
			name = 'Inline Docstring',
			dscr = 'One line string used to document code.',
		}, {
			text({"'''"}), insert(1, 'docstring'), text({"'''"}), insert(2, "")
		}),
		snip({
			trig = 'docm',
			name = 'Multiline Docstring',
			dscr = 'Deltailed, multiline string used to document code.',
		}, {
			text({"'''",
			""}), insert(1, "docstring"), text({"",
			":param: "}), insert(2, "info about parameters"), text({"",
			":ptype: "}), insert(3, "info about param types"), text({"",
			":return: "}), insert(4, "info about return value"), text({"",
			":rtype: "}), insert(5, "info about return type"), text({"",
			":raises error: "}), insert(6, "error type and when"), text({"",
			"'''"}), insert(7, "")
		})
	},
})
