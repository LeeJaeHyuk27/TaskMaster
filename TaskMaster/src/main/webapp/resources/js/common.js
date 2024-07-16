/**
 * 메시지를 출력한다.
 * @param {String} msg 메시지
 * @param {Integer} left left값
 * @param {String} type 메시지타입
 */
export function msg_show(msg, left, type) {

    let _left = left ? left : 0;
    let _type = "#176BD8";

    if(type === 'E'){
        _type = "#e92f11";
    }else if(type === 'W'){
        _type = "#ee9618";
    }

    let msg_tag = `<span class="msg_tag" style="
                    display: inline-block;
                    position: fixed;
                    top: 20%;
                    left: ${_left}%;
                    background: ${_type};
                    color: #ffffff;
                    box-shadow: 5px 5px 5px rgba(0, 0, 0, 0.3);
                    border-radius: 8px;
                    opacity: 0;
                    padding: 8px 14px;
                    text-align: center;">${msg}</span>`;
    
    $('body').append(msg_tag);

    $('.msg_tag').animate({
        opacity: 1
    }, 700);

    setTimeout(() => {
        $('.msg_tag').animate({
            opacity: 0
        }, 700, function(){
            $('.msg_tag').remove();
        });
    }, 1500);
    
}
