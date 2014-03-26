angular.module("artSlotAppCtrls")
  .controller("charactersCtrl", [
    "$scope", "$http", "characterRes", "$routeParams", "userRes"
      ($scope, $http, characterRes, $routeParams, userRes) ->

        $scope.projectId = $routeParams.id

        characterRes.query({project_id: $scope.projectId}, (data)->
            $scope.characters = data;
        )

        $scope.saveCharacter = ->
          $scope.character.project_id = $routeParams.id
          $scope.suggestActors($scope.character)
          characterRes.save($scope.character, (response)->
              #add the response to the characters' array
              $scope.characters.push(response);

          #empty the character's form on the view
          $scope.character = {}
          )

        $scope.suggestActors = (character) ->
          # this doesn't seem to be working. if any of the
          #attributes are left blank, the response is undefined
          #and therefore returns all of the users.
          result = userRes.query {
            career: "actor"
            age: character.age
            height: character.height
            weight: character.weight
            eye_color: character.eye_color
            hair_color: character.hair_color
            gender: character.gender
          }
          result.$promise.then (suggestions) ->
            $scope.suggestions = suggestions
            console.log "Sugs:" + angular.toJson $scope.suggestions

])

angular.module("artSlotAppCtrls")
  .controller("characterDetailsCtrl", [
    "$scope", "$routeParams", "$http"
      ($scope, $routeParams, $http) ->
            $scope.characterId = $routeParams.id

            $scope.character = null

            $http.get("/characters/"+$scope.characterId+".json").
                success((data) ->
                    console.log(data);
                    $scope.character = data;
              )

])
