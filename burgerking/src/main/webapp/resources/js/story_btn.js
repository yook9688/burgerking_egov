$(document).ready(function() { 
    $("#con_btn1").on("click", function() {
        if($(".story_box1").hasClass("hide")) {
            $(".story_box1").removeClass("hide").addClass("show")
            $(".story_box2").removeClass("show").addClass("hide")
        }
        if($(".why_con1").hasClass("hide")) {
            $(".why_con1").removeClass("hide").addClass("show")
            $(".why_con2").removeClass("show").addClass("hide")
            $(".why_con3").removeClass("show").addClass("hide")
            $(".why_con4").removeClass("show").addClass("hide")
        }
        // } else if($(".story_box2").hasClass("show")){
        //     $(".story_box2").removeClass("show").addClass("hide")
        // }
    });
    $("#con_btn2").on("click", function() {
        if($(".story_box2").hasClass("hide")) {
            $(".story_box2").removeClass("hide").addClass("show")
            $(".story_box1").removeClass("show").addClass("hide")
        }
        if($(".why_con2").hasClass("hide")) {
            $(".why_con2").removeClass("hide").addClass("show")
            $(".why_con1").removeClass("show").addClass("hide")
            $(".why_con3").removeClass("show").addClass("hide")
            $(".why_con4").removeClass("show").addClass("hide")
        }
        // } else if($(".story_box2").hasClass("show")){
        //     $(".story_box2").removeClass("show").addClass("hide")
        // }
    });
    $("#con_btn3").on("click", function() {
        if($(".why_con3").hasClass("hide")) {
            $(".why_con3").removeClass("hide").addClass("show")
            $(".why_con1").removeClass("show").addClass("hide")
            $(".why_con2").removeClass("show").addClass("hide")
            $(".why_con4").removeClass("show").addClass("hide")
        }
        // } else if($(".story_box2").hasClass("show")){
        //     $(".story_box2").removeClass("show").addClass("hide")
        // }
    });
    $("#con_btn4").on("click", function() {
        if($(".why_con4").hasClass("hide")) {
            $(".why_con4").removeClass("hide").addClass("show")
            $(".why_con1").removeClass("show").addClass("hide")
            $(".why_con2").removeClass("show").addClass("hide")
            $(".why_con3").removeClass("show").addClass("hide")
        }
        // } else if($(".story_box2").hasClass("show")){
        //     $(".story_box2").removeClass("show").addClass("hide")
        // }
    });
});