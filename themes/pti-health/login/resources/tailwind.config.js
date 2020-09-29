const defaultTheme = require('tailwindcss/defaultTheme')
const plugin = require('tailwindcss/plugin')
const TUI = require('@tailwindcss/ui')

module.exports = {
  purge: ['../*.ftl'],
  theme: {
    extend: {
      fontFamily: { sans: ['Inter var', ...defaultTheme.fontFamily.sans] },
      colors: {},
    },
  },
}
