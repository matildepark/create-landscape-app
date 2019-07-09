/+  *server
/=  tile-js
  /^  octs
  /;  as-octs:mimes:html
  /:  /===/app/%APPNAME%/js/tile
  /|  /js/
      /~  ~
  ==
=,  format
::
|%
:: +move: output effect
::
+$  move  [bone card]
:: +card: output effect payload
::
+$  poke
  $%  [%launch-action [@tas path @t]]
  ==
::
+$  card
  $%  [%poke wire dock poke]
      [%http-response =http-event:http]
      [%connect wire binding:eyre term]
      [%diff %json json]
  ==
::
--
::
|_  [bol=bowl:gall ~]
::
++  this  .
::
++  bound
  |=  [wir=wire success=? binding=binding:eyre]
  ^-  (quip move _this)
  [~ this]
::
++  prep
  |=  old=(unit ~)
  ^-  (quip move _this)
  =/  launcha
    [%launch-action [%%APPNAME% /%APPNAME%tile '/~%APPNAME%/js/tile.js']]
  :_  this
  :~
    [ost.bol %connect / [~ /'~%APPNAME%'] %%APPNAME%]
    [ost.bol %poke /%APPNAME% [our.bol %launch] launcha]
  ==
::
++  peer-%APPNAME%tile
  |=  pax=path
  ^-  (quip move _this)
  [[ost.bol %diff %json *json]~ this]
::
++  send-tile-diff
  |=  jon=json
  ^-  (list move)
  %+  turn  (prey:pubsub:userlib /%APPNAME%tile bol)
  |=  [=bone ^]
  [bone %diff %json jon]
::
++  poke-handle-http-request
  %-  (require-authorization:app ost.bol move this)
  |=  =inbound-request:eyre
  ^-  (quip move _this)
  =/  request-line  (parse-request-line url.request.inbound-request)
  =/  back-path  (flop site.request-line)
  =/  name=@t
    =/  back-path  (flop site.request-line)
    ?~  back-path
      ''
    i.back-path
  ::
  ?~  back-path
    [[ost.bol %http-response not-found:app]~ this]
  ?:  =(name 'tile')
    [[ost.bol %http-response (js-response:app tile-js)]~ this]
  [[ost.bol %http-response not-found:app]~ this]
::
--
