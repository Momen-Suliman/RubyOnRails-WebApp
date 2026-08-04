import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'
import react from '@vitejs/plugin-react' // Clean, standard React plugin

export default defineConfig({
  plugins: [
    RubyPlugin(),
    react(),
  ],
})
