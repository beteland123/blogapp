const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      animation: {
        blob: "blob 7s infinite",
      },
      keyframes: {
        blob: {
          "0%": {
            transform: "translate(0, 0) scale(1)",
          },
          "25%": {
            transform: "translate(30%, 0%) scale(1.1)",
          },
          "50%": {
            transform: "translate(-10%, 0%) scale(0.9)",
          },
          "75%": {
            transform: "translate(10%, 0%) scale(1.05)",
          },
          "100%": {
            transform: "translate(0, 0) scale(1)",
          },
        },
      },
      
    },
  
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
