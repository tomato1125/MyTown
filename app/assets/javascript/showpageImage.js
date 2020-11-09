$(function() {
  $('.subImage').hover(function() {
    let ImgStyle = $(this).attr("style");
    $("#mainImage").attr({style:ImgStyle});
    $("#mainImage").val("");
    $("#mainImage").fadeIn();
      return false;
  });
});

// <%= image_tag image.image.url, :id => "#{i}", class: "subImage"%>