module = angular.module 'totem',
  [
    'ui.router'
    'ui.bootstrap'
    'firebase'
    'totem.Object'
    'totem.home'
    'totem.post'
  ]

module.config ($urlRouterProvider, $provide) ->

  # Default State
  $urlRouterProvider.otherwise("home")

module.run () ->

  appId = "mfQLWgeMhBgRT4Vrjx3dcHNX0c8g2cefSyO7ouf4"
  clientId = "xqJzyWcR0BABwLXB0DR6wd6E7ErpSlAHASxmuj5N"
  javascriptId = "P2Gy5kkiXQaJqfaDHxr2khS7B5pE1y67DT5tUSgJ"
  restid = "8N78OlHKoL3lihj03GpilcotCSMnnLMDe1WLY07a"

  Parse.initialize(appId, javascriptId)