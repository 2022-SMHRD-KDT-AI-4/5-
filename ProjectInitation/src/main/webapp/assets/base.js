$(function(){
   
    
    var bw = $(window).width;
    
    if( bw <= 910 ){
       
        /* 햄버거메뉴 클릭 */
    $('.mnb button').click(function(){
        
        $(this).fadeOut();
        $('.mnb_inner').animate({
            marginRight : 0
        }, 1000 );
        
    })
    
    /* 닫기 버튼 클릭 */
    $('.exit').click(function(){
        
        $('.mnb button').fadeIn();
        $('.mnb_inner').animate({
            marginRight : '-60%'
        }, 1000 );
        
    })
       
       
       }
    else{
        
        
        /* 햄버거메뉴 클릭 */
    $('.mnb button').click(function(){
        
        $(this).fadeOut();
        $('.mnb_inner').animate({
            marginRight : 0
        }, 1000 );
        
    })
    
    /* 닫기 버튼 클릭 */
    $('.exit').click(function(){
        
        $('.mnb button').fadeIn();
        $('.mnb_inner').animate({
            marginRight : '-40%'
        }, 1000 );
        
    })
        
        
        
    }
   
    
    /* top 버튼 */
    $(window).scroll(function(){
        
        if( $(this).scrollTop() > 500 ){
            $('.top').fadeIn();
        } else {
            $('.top').fadeOut();
        }
        
    })
    
    $('.top').click(function(){
        $('html, body').animate({
            scrollTop : 0
        }, 400);
        return false;
    })
    
    
    
    /* 더보기 버튼 */
    $('.more').click(function(){
        $('.m_li').fadeIn(1000);
        $('.more').fadeOut();
    })
    
    
});