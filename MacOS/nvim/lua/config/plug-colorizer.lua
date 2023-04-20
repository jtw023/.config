local colorizer = require('colorizer')

colorizer.setup(
  {'sql', 'python', 'lua';},
  {
	RGB      = true;         -- #RGB hex codes
	RRGGBB   = true;         -- #RRGGBB hex codes
	names    = true;         -- "Name" codes like Blue
	RRGGBBAA = true;         -- #RRGGBBAA hex codes
	rgb_fn   = true;         -- CSS rgb() and rgba() functions
	hsl_fn   = true;         -- CSS hsl() and hsla() functions
  })
