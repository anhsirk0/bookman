import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import tailwindcss from "@tailwindcss/vite";

export default defineConfig({
  plugins: [react({ include: ["**/*.res.mjs"] }), tailwindcss()],
  build: {
    rollupOptions: {
      output: {
        assetFileNames: (assetInfo) => `assets/${assetInfo.name}`,
      },
    },
  },
});
