function ContactCtrl($scope, $http) {
    $scope.url = '/message';
    $scope.showMessageForm = false;
    $scope.messageSent = false;
    $scope.messageSucceeded = false;
    $scope.messageError = false;

    $scope.send = function() {
        $scope.messageSent = true;

        $http.post($scope.url, { "message": $scope.message, "from_email": $scope.from_email }).
        success(function(data, status) {
            $scope.status = status;
            $scope.data = data;
            $scope.messageSucceeded = true;
        })
        .
        error(function(data, status) {
            $scope.data = data || "Request failed";
            $scope.status = status;
            $scope.messageError = true;
            $scope.messageSent = false;
        });
    };

    $scope.toggleMessageForm = function() {
        $scope.messageSent = false;
        $scope.messageSucceeded = false;
        $scope.messageError = false;
        $scope.showMessageForm = !$scope.showMessageForm;
    }
}