

<style>

/* =========================================
   CHATBOT MAIN
========================================= */

#geminiChatbot {
    position: fixed;
    right: 25px;
    bottom: 25px;
    z-index: 99999;
    font-family: Arial, sans-serif;
}


/* =========================================
   FLOATING BUTTON
========================================= */

.chatbot-toggle {
    width: 62px;
    height: 62px;
    border: 0;
    border-radius: 50%;

    background: linear-gradient(
        135deg,
        #18a974,
        #0d8f62
    );

    color: #fff;

    font-size: 25px;

    cursor: pointer;

    box-shadow:
        0 8px 25px rgba(0,0,0,.20);

    transition: .3s;

    position: relative;
}

.chatbot-toggle:hover {
    transform: scale(1.08);
}


/* Notification */

.chat-notification {
    position: absolute;

    top: -2px;
    right: -2px;

    width: 20px;
    height: 20px;

    background: #ff4757;

    color: #fff;

    font-size: 11px;

    border-radius: 50%;

    display: flex;
    align-items: center;
    justify-content: center;

    border: 2px solid #fff;
}


/* =========================================
   CHAT WINDOW
========================================= */

.chatbot-window {

    position: absolute;

    right: 0;
    bottom: 75px;

    width: 370px;
    height: 520px;

    background: #fff;

    border-radius: 18px;

    overflow: hidden;

    box-shadow:
        0 15px 50px rgba(0,0,0,.20);

    display: none;

    flex-direction: column;

    animation: chatbotOpen .25s ease;
}

.chatbot-window.active {
    display: flex;
}


@keyframes chatbotOpen {

    from {
        opacity: 0;
        transform: translateY(15px) scale(.97);
    }

    to {
        opacity: 1;
        transform: translateY(0) scale(1);
    }

}


/* =========================================
   HEADER
========================================= */

.chatbot-header {

    height: 72px;

    padding: 0 18px;

    background:
        linear-gradient(
            135deg,
            #18a974,
            #0d8f62
        );

    color: #fff;

    display: flex;

    align-items: center;

    justify-content: space-between;
}


.bot-profile {
    display: flex;
    align-items: center;
    gap: 11px;
}


.bot-avatar {

    width: 42px;
    height: 42px;

    border-radius: 50%;

    background: rgba(255,255,255,.18);

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 19px;

    border: 1px solid rgba(255,255,255,.25);
}


.bot-profile strong {

    display: block;

    font-size: 15px;
}


.bot-profile small {

    display: block;

    font-size: 11px;

    margin-top: 3px;

    opacity: .9;
}


.online-dot {

    display: inline-block;

    width: 7px;
    height: 7px;

    background: #62ffad;

    border-radius: 50%;

    margin-right: 4px;
}


#chatbotClose {

    border: 0;

    background: transparent;

    color: #fff;

    font-size: 28px;

    cursor: pointer;

    line-height: 1;
}


/* =========================================
   MESSAGES
========================================= */

.chat-messages {

    flex: 1;

    padding: 18px;

    overflow-y: auto;

    background: #f7f9fb;
}


.chat-messages::-webkit-scrollbar {
    width: 5px;
}

.chat-messages::-webkit-scrollbar-thumb {
    background: #d8dfe4;
    border-radius: 10px;
}


/* =========================================
   BOT MESSAGE
========================================= */

.bot-message {

    display: flex;

    align-items: flex-start;

    gap: 8px;

    margin-bottom: 15px;
}


.message-avatar {

    width: 28px;
    height: 28px;

    min-width: 28px;

    border-radius: 50%;

    background: #18a974;

    color: #fff;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 12px;
}


.message-content {

    background: #fff;

    padding: 11px 14px;

    border-radius:
        4px 14px 14px 14px;

    color: #444;

    font-size: 13px;

    line-height: 1.6;

    max-width: 80%;

    box-shadow:
        0 2px 8px rgba(0,0,0,.04);
}


/* =========================================
   USER MESSAGE
========================================= */

.user-message {

    display: flex;

    justify-content: flex-end;

    margin-bottom: 15px;
}


.user-message .message-content {

    background: #18a974;

    color: #fff;

    border-radius:
        14px 4px 14px 14px;

    max-width: 80%;
}


/* =========================================
   TYPING
========================================= */

.typing-indicator {

    display: none;

    align-items: center;

    gap: 4px;

    padding: 5px 18px 10px;

    background: #f7f9fb;
}


.typing-indicator span {

    width: 6px;
    height: 6px;

    background: #18a974;

    border-radius: 50%;

    animation: typing 1.2s infinite;
}


.typing-indicator span:nth-child(2) {
    animation-delay: .15s;
}

.typing-indicator span:nth-child(3) {
    animation-delay: .3s;
}


.typing-indicator small {

    color: #999;

    margin-left: 5px;

    font-size: 10px;
}


@keyframes typing {

    0%, 60%, 100% {
        transform: translateY(0);
    }

    30% {
        transform: translateY(-5px);
    }

}


/* =========================================
   INPUT
========================================= */

.chatbot-input-area {

    height: 65px;

    background: #fff;

    border-top: 1px solid #eee;

    padding: 10px;

    display: flex;

    align-items: center;

    gap: 8px;
}


#chatInput {

    flex: 1;

    height: 44px;

    border: 1px solid #e4e8ec;

    border-radius: 12px;

    padding: 0 13px;

    outline: none;

    font-size: 13px;

    color: #333;

    transition: .2s;
}


#chatInput:focus {

    border-color: #18a974;

    box-shadow:
        0 0 0 3px rgba(24,169,116,.08);
}


#sendMessage {

    width: 44px;
    height: 44px;

    border: 0;

    border-radius: 12px;

    background: #18a974;

    color: #fff;

    cursor: pointer;

    font-size: 15px;

    transition: .2s;
}


#sendMessage:hover {

    background: #128b5f;

    transform: translateY(-1px);
}


/* =========================================
   MOBILE
========================================= */

@media(max-width: 480px) {

    #geminiChatbot {

        right: 15px;
        bottom: 15px;
    }


    .chatbot-window {

        position: fixed;

        right: 10px;
        left: 10px;

        bottom: 85px;

        width: auto;

        height: calc(100vh - 120px);

        max-height: 600px;

        border-radius: 16px;
    }

}

</style>
       <!-- ==============================
     GEMINI CHATBOT
================================ -->

<div id="geminiChatbot">

    <!-- Floating Button -->
    <button id="chatbotToggle" class="chatbot-toggle">

        <i class="fa fa-comments"></i>

        <span class="chat-notification">
            1
        </span>

    </button>


    <!-- Chat Window -->
    <div class="chatbot-window">

        <!-- Header -->
        <div class="chatbot-header">

            <div class="bot-profile">

                <div class="bot-avatar">
                    <img src="{{asset($settings->logo)}}" style="width:40px; border-radius:50%;>
                    <i class="fa fa-robot"></i>
                </div>

                <div>
                    <strong>Golden Ratio AI Chatbot</strong>

                    <small>
                        <span class="online-dot"></span>
                        Online
                    </small>
                </div>

            </div>


            <button id="chatbotClose">
                ×
            </button>

        </div>


        <!-- Messages -->
        <div id="chatMessages" class="chat-messages">

            <div class="bot-message">

                <div class="message-avatar">
                    <i class="fa fa-robot"></i>
                </div>

                <div class="message-content">
                    Hello! 👋
                    <br>
                    How can I help you today?
                </div>

            </div>

        </div>


        <!-- Typing -->
        <div id="typingIndicator" class="typing-indicator">

            <span></span>
            <span></span>
            <span></span>

            <small>AI is typing...</small>

        </div>


        <!-- Input -->
        <div class="chatbot-input-area">

            <input
                type="text"
                id="chatInput"
                placeholder="Type your message..."
                autocomplete="off"
            >

            <button id="sendMessage">

                <i class="fa fa-paper-plane"></i>

            </button>

        </div>

    </div>

</div>


<script>

document.addEventListener('DOMContentLoaded', function () {

    const toggle = document.getElementById('chatbotToggle');
    const close = document.getElementById('chatbotClose');

    const windowBox =
        document.querySelector('.chatbot-window');

    const input =
        document.getElementById('chatInput');

    const send =
        document.getElementById('sendMessage');

    const messages =
        document.getElementById('chatMessages');

    const typing =
        document.getElementById('typingIndicator');

    const notification =
        document.querySelector('.chat-notification');


    /* =========================================
       OPEN CHAT
    ========================================= */

    toggle.addEventListener('click', function () {

        windowBox.classList.toggle('active');

        notification.style.display = 'none';

        if (windowBox.classList.contains('active')) {
            setTimeout(() => input.focus(), 200);
        }

    });


    /* =========================================
       CLOSE CHAT
    ========================================= */

    close.addEventListener('click', function () {

        windowBox.classList.remove('active');

    });


    /* =========================================
       ADD MESSAGE
    ========================================= */

    function addMessage(message, type) {

        const wrapper = document.createElement('div');

        wrapper.className =
            type === 'user'
                ? 'user-message'
                : 'bot-message';


        const content = document.createElement('div');

        content.className = 'message-content';


        // Prevent HTML injection
        content.textContent = message;


        if (type === 'bot') {

            const avatar = document.createElement('div');

            avatar.className = 'message-avatar';

            avatar.innerHTML =
                '<i class="fa fa-robot"></i>';

            wrapper.appendChild(avatar);

        }


        wrapper.appendChild(content);

        messages.appendChild(wrapper);


        messages.scrollTop =
            messages.scrollHeight;

    }


    /* =========================================
       SEND MESSAGE
    ========================================= */

    async function sendChat() {

        const message =
            input.value.trim();


        if (!message) {
            return;
        }


        // User message
        addMessage(message, 'user');


        input.value = '';

        input.disabled = true;

        send.disabled = true;


        // Show typing
        typing.style.display = 'flex';


        messages.scrollTop =
            messages.scrollHeight;


        try {

            const response = await fetch(
                "{{ route('gemini.chat') }}",
                {
                    method: 'POST',

                    headers: {

                        'Content-Type':
                            'application/json',

                        'X-CSRF-TOKEN':
                            "{{ csrf_token() }}",

                        'Accept':
                            'application/json'

                    },

                    body: JSON.stringify({

                        message: message

                    })

                }
            );


            const data =
                await response.json();


            console.log('Gemini Response:', data);


            typing.style.display = 'none';


            /* =========================================
               SUCCESS
            ========================================= */

            if (data.success && data.message) {

                addMessage(
                    data.message,
                    'bot'
                );

            }


            /* =========================================
               ERROR
            ========================================= */

            else {

                addMessage(
                    data.message ||
                    'Sorry, something went wrong.',
                    'bot'
                );

            }


        } catch (error) {

            console.error(
                'Gemini Error:',
                error
            );


            typing.style.display = 'none';


            addMessage(
                'Sorry, I could not connect to the AI server.',
                'bot'
            );

        }


        input.disabled = false;

        send.disabled = false;

        input.focus();

    }


    /* =========================================
       SEND BUTTON
    ========================================= */

    send.addEventListener(
        'click',
        sendChat
    );


    /* =========================================
       ENTER KEY
    ========================================= */

    input.addEventListener(
        'keydown',
        function (e) {

            if (
                e.key === 'Enter' &&
                !e.shiftKey
            ) {

                e.preventDefault();

                sendChat();

            }

        }
    );

});

</script>