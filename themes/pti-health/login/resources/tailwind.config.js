const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  purge: ["../*.ftl"],
  theme: {
    extend: {
      fontFamily: { sans: ["Inter var", ...defaultTheme.fontFamily.sans] },
      colors: {
        primary: "#27BEC2",
        secondary: "#FFF4E9",
        accent: "#F08F77",
      },
      screens: {
        xl: "1200px",
      },
    },
  },
  plugins: [require("@tailwindcss/ui")],
};
