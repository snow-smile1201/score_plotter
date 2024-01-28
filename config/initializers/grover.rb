# frozen_string_literal: true

Grover.configure do |config|
  config.options = {
    display_url: "http://localhost:3000",
    print_background: true,
    format: 'A4',
    width: '4093px',
    height: '2894px',
    landscape: true,
    margin: {
      top: '30px',
      right: '20px',
      left: '20px'
    },
    prefer_css_page_size: true,
    emulate_media: 'screen',
    cache: false,
    timeout: 2000, # Timeout in ms. A value of `0` means 'no timeout'
    launch_args: ['--font-render-hinting=medium', '--lang=ja'], # 日本語表示のため --lang=ja を追加
    wait_until: 'domcontentloaded'
  }
end