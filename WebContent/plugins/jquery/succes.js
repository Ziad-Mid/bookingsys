$(function () {
        var Toast = Swal.mixin({
          toast: true,
          position: "top-end",
          showConfirmButton: false,
          timer: 5000,
        });

        $(document).ready(function () {
          Toast.fire({
            icon: "success",
            title: "Lorem ipsum dolor sit amet, consetetur sadipscing elitr.",
          });
        });
      });