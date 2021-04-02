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

## format: false
```
[3] pry(#<ActionDispatch::Journey::Router>)> req.path_info
=> "/roots/aaaaaaaaa.gif"
[4] pry(#<ActionDispatch::Journey::Router>)> parameters
=> {:controller=>"roots", :action=>"show", :id=>"aaaaaaaaa.gif"}
[1] pry(#<RootsController>)> params
=> <ActionController::Parameters {"controller"=>"roots", "action"=>"show", "id"=>"aaaaaaaaa.gif", "format"=>"html"} permitted: false>
```


## format: true
```
[3] pry(#<ActionDispatch::Journey::Router>)> req.path_info
=> "/roots/aaaaaaaaa.gif"
[2] pry(#<ActionDispatch::Journey::Router>)> parameters
=> {:controller=>"roots", :action=>"show", :id=>"aaaaaaaaa", :format=>"gif"}
[2] pry(#<RootsController>)> params
=> <ActionController::Parameters {"controller"=>"roots", "action"=>"show", "id"=>"aaaaaaaaa", "format"=>"html"} permitted: false>
```
