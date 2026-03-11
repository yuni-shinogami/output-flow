/**
 * TailwindCSS カスタム設定（Marp スライド用）
 *
 * slides.md 内の <script> タグで読み込む:
 *   tailwind.config = { ... }
 *
 * このファイルは参照用。実際の設定は slides.md テンプレートに
 * インラインで埋め込まれる。
 */
const tailwindConfig = {
  corePlugins: {
    // Marp のベーススタイルと衝突しないよう preflight を無効化
    preflight: false,
  },
  theme: {
    extend: {
      colors: {
        'brand-orange': '#F5A623',
        'brand-orange-dark': '#F09819',
        'brand-orange-light': '#F7CE68',
        'brand-red': '#B71C1C',
        'brand-black': '#333333',
        'brand-gray': '#e0e0e0',
      },
      fontSize: {
        // em ベースのフォントサイズ（Marp のスケーリングに追従）
        'slide-xs': '0.75em',
        'slide-sm': '0.875em',
        'slide-base': '1em',
        'slide-lg': '1.25em',
        'slide-xl': '1.5em',
        'slide-2xl': '2em',
        'slide-3xl': '2.5em',
        'slide-4xl': '3em',
      },
    },
  },
};
