app = angular.module 'app', ['ngFileUpload', 'restangular']

app.controller 'uploadCtrl', ($scope, Upload, Restangular) ->
  api = Restangular.all 'api/docs'
  $scope.getList = -> api.getList().then (res) -> $scope.docs = res
  $scope.getOne = -> api.one('new').get().then (res) -> $scope.doc = res
  $scope.getList()
  $scope.getOne()

  $scope.upload = ->
    api.withHttpConfig(transformRequest: angular.identity)
    .customPOST(objectToFormData($scope.doc), '', undefined, 'Content-Type': undefined)
    .then (res) ->
      $scope.getOne()
      $scope.getList()
    .catch (err) ->
      alert JSON.stringify(err.data)

  $scope.pushFile = (p) ->
    $scope.doc.anexos.push {file: p[0]}

  $scope.destroy = (p) ->
    p.remove()
    .then ->
      $scope.getList()
    .catch (err) ->
      alert JSON.stringify(err.data)



  # Transforma objeto JSON em objeto FormData
  objectToFormData = (obj, form, namespace) ->
    fd = form or new FormData()
    for property of obj
      if obj.hasOwnProperty(property)
        if namespace
          formKey = namespace + "[" + property + "]"
        else
          formKey = property
        if typeof obj[property] is "object" and !(obj[property] instanceof File) and !(obj[property] instanceof Date)
          objectToFormData obj[property], fd, formKey
        else
          fd.append formKey, obj[property] unless angular.isFunction(obj[property])
    fd



