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
