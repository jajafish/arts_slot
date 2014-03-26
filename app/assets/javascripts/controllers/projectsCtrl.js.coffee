angular.module("artSlotAppCtrls")
  .controller("projectsCtrl", [
    "$scope", "$http", "projectRes", "$location", "$routeParams"
      ($scope, $http, projectRes, $location, $routeParams) ->


        $scope.projects = []

        $scope.project = projectRes.get(id: $routeParams.id)

        projectRes.query((data) ->
            console.log(data);
            $scope.projects = data;
            )


        $scope.createProject = ->
          $scope.project = {}
          project = new projectRes($scope.project)
          newProject = project.$save ->
              $location.path("/projects/"+project.id)

        $scope.updateProject = ->
          console.log $scope.project
          $scope.project.id = $routeParams.id

          console.log  projectRes.update($scope.project)


  ])
