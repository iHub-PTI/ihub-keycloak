const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  purge: ["../*.ftl"],
  theme: {
    extend: {
      fontFamily: { sans: ["Inter var", ...defaultTheme.fontFamily.sans] },
      colors: {
        primary: {
          100: "#D4F2F3",
          200: "#A9E5E7",
          300: "#7DD8DA",
          400: "#65CFD3",
          500: "#27BEC2",
          600: "#13A5A9",
          700: "#177274",
          800: "#104C4E",
          900: "#082627",
        },
        secondary: {
          100: "#FCE9E4",
          200: "#F9D2C9",
          300: "#FCBEAF",
          400: "#F3A592",
          500: "#F08F77",
          600: "#C0725F",
          700: "#905647",
          800: "#603930",
          900: "#301D18",
        },
        linen: {
          100: "#FFFDFB",
          200: "#FFFBF6",
          300: "#FFF8F2",
          400: "#FFF6ED",
          500: "#FFF4E9",
          600: "#CCC3BA",
          700: "#99928C",
          800: "#66625D",
          900: "#33312F",
        },
      },
      screens: {
        xl: "1200px",
      },
      maxWidth: {
        "screen-2xl": "1440px",
      },
      width: {
        500: "500px",
      },
    },
  },
  plugins: [require("@tailwindcss/ui")],
};
