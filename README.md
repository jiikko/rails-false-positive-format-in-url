# :idパラメータにマッチするformatを無効にする動作確認railsプロジェクト
`resources :roots, format: false, constraints: { id: /([^\/])+/ }`

## デフォルトの挙動
* http://localhost:3000/roots/aaaaaaaaa.gif
  * `Processing by RootsController#show as GIF`
  * `Completed 406 Not Acceptable`
* http://localhost:3000/roots/aaaaaaaaa.gif/edit
  * `Processing by RootsController#edit as HTML`
  * `Completed 200 OK`

## before_actionでformatを上書き
`before_action ->{ request.format = :html }`

* http://localhost:3000/roots/aaaaaaaaa.gif
  * Processing by RootsController#show as GIF
  * Completed 200 OK
* http://localhost:3000/roots/aaaaaaaaa.gif/edit
  * `Processing by RootsController#edit as HTML`
  * `Completed 200 OK`

## FAQ
### これやっていいの?
コメントで書いていたので問題なさそう
https://github.com/rails/rails/blob/ac6aa32f7cf66264ba87eabed7c042bb60bcf3a2/actionpack/lib/action_dispatch/http/mime_negotiation.rb#L122-L135
