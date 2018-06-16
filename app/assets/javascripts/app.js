$(function(){
    $('#prototype_captured_images_attributes_0_content').on('change',function(e){
        var file = e.target.files[0];
        var fr = new FileReader();
        var reader = fr.readAsDataURL(file);

        console.log(reader)
        // fr.onload = function(){
        //   var file = e.target.files[0];
        //   file.attr('src',fr.result);
        // }
        // var hoge = fr.readAsDataURL(file);
        // console.log(hoge)
        $preview = $('#main_image_uploader');
        $preview.css("background-image", "");
    });
});


// $(function(){
//     $('#file').change(function(){
//         $('img').remove();
//         var file = $(this).prop('files')[0];
//         if(!file.type.match('image.*')){
//             return;
//         }
//         var fileReader = new FileReader();
//         fileReader.onloadend = function() {
//             $('#result').html('<img src="' + fileReader.result + '"/>');
//         }
//         fileReader.readAsDataURL(file);
//     });
// });


// $('#prototype_captured_images_attributes_0_content ').change(
//     function () {
//         // if (!this.files.length) {
//         //     return;
//         // }

//         // var file = $(this).prop('files')[0];
//         // var fr = new FileReader();
//         $('.cover-image-upload ').css('background', 'none');
//         fr.onload = function() {
//             $('.cover-image-upload ').css('background', 'url(' + fr.result + ')');
//         }
//         // fr.readAsDataURL(file);
//         // $(".#main_image_uploader img").css('opacity', 0);
//     }
// );
