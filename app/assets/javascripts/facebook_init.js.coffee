root = exports ? this

root.facebook_init = (appId) ->
  # needs to be called before FB.init for status: true to fire this event.
  FB.Event.subscribe('auth.statusChange', (response) ->
    switch response.status
      when 'connected' then register_user()  # user has authorised app
      when 'not_authorized' then show_login() # user has not authorised app
      else facebook_login() # user is not logged into facebook
  )

  FB.init(
     appId: appId
     status: true
     cookie: true,
     oauth: true
  )

root.login = ->
  show_login()

register_user = ->
  FB.api "/me", (response) ->
    $('#div_welcome_message').children().remove()
    $('#div_welcome_message').append "<p>Welcome #{response.first_name}</p>"

show_login = ->
  FB.login (response) ->
    if (response.status == 'connected')
      register_user
    else
      $('#div_status_message').children().remove()
      $('#div_status_message').append '<p>Please <a href="#" onclick="login()">authorise app</a></p>'

facebook_login = ->
  alert('please log into facebook')

get_access_token = ->
  request_permissions('read_friendlists')
   #request = request_permissions('read_friendlists')
   #request.fail(
   #  alert('We were unable to retrieve your details')
   #)
   #return request

request_permissions = (perms) ->
  #login = $.Deferred()
  try
    FB.login ((response) ->
      if (!response.authResponse)
        #login.reject()
        alert('failed')
        return

      access_token = FB.getAuthResponse()['accessToken']
      alert(access_token)
      $("#fb-root").data('accessToken', access_token)
      #login.resolve(access_token)
    ),
      scope: perms
    #login.promise()
  catch error
    alert(error)
