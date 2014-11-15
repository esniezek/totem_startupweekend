module = angular.module('totem.Object', [])

module.factory 'AppObject', ($state, $firebase) ->

  class AppObject

    constructor: ()->

      ## setup firebase
      @root = new Firebase("https://resplendent-fire-8698.firebaseio.com/")
      @sync = $firebase(@root)

      @usersSync = $firebase(@root.child("users"))
      @users = @usersSync.$asArray()

      @postsSync = $firebase(@root.child("posts"))
      @posts = @postsSync.$asArray()

      @user = {}

      @loggedIn = false

      @amount = ''

      @text = ''

      @imageFile = false

    login: (username)->

      console.log "logging in with username: #{username}"

      ## get or create user from firebase

      userRef = @root.child("users/#{username}")
      userSync = $firebase(userRef)

      @user = userSync.$asObject()

      @user.username = username

      @user.$save()

      @loggedIn = true

      $state.go('home')

    logout: ()->

      @user = {}

      @loggedIn = false

      $state.go('')

    post: ()->


      newPost = {

        user: @user.username
        text: @text
        amount: @amount
      }

      ## set tagged people

      ## save post to firebase

      @posts.$add(newPost).then (result)->

        console.log "new post saved in firebase: #{result}"

        console.log "image file: #{@imageFile.name}"

        ## create parse post object
        PostObject = new Parse.Object.extend("Post")

        post = new PostObject()
        post.set("firebase_id", result.name())

        post.save(null,

          (post)->

            console.log "post saved in parse: #{post}"

            ## save file

            file = @imageFile
            name = file.name

            parsefile = new Parse.File name, file

            parsefile.save().then (imageFile)->

              console.log "image successfully saved"

              ## associate file with post

              post.set("image", imageFile)

              post.save().then ()->

                # save image url to firebase

                $state.go('home')


          (error)->

            console.log error

            $state.go('home')
        )


    getPostsForCause: (id)->

      ## get posts for a cause from firebase

    getCause: (id)->

      ## get cause by id

  window.app = new AppObject()