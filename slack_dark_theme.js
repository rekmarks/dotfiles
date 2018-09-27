// First make sure the wrapper app is loaded
document.addEventListener("DOMContentLoaded", function() {

    // Then get its webviews
    let webviews = document.querySelectorAll(".TeamView webview");

    // Fetch our CSS in parallel ahead of time
    const cssPath = 'https://cdn.rawgit.com/widget-/slack-black-theme/master/custom.css';
    let cssPromise = fetch(cssPath).then(response => response.text());

    let customCustomCSS = `
    :root {
      /* Modify these to change your theme colors: */
      --primary: #61AFEF;
      --text: #ABB2BF;
      --background: #282C34;
      --background-elevated: #3B4048;
    }
    div.c-message.c-message--light.c-message--hover {
      color: #fff !important;
      background-color: #222 !important;
    }

    span.c-message__body,
    a.c-message__sender_link,
    span.c-message_attachment__media_trigger.c-message_attachment__media_trigger--caption,
    div.p-message_pane__foreword__description span {
      color: #afafaf !important;
    }

    pre.special_formatting {
      background-color: #222 !important;
      color: #afafaf !important;
      border: solid;
      border-width: 1 px !important;
    }
    .c-message, .c-virtual_list__item {
      background-color: #222 !important;
    }
    #file_preview_scroller .message_sender,
    #file_preview_scroller .file_viewer_link,
    #file_preview_scroller .comment_body,
    #file_preview_scroller .ts_tip_btn,
    #file_preview_scroller .file_comment_tip,
    #file_preview_scroller .file_meta,
    #file_preview_scroller .file_ssb_download_link,
    .c-member--medium,
    .c-member__display-name,
    .c-member__secondary-name--medium,
    .c-team__display-name,
    .c-usergroup__handle,
    .c-message_attachment,
    .c-message_attachment__pretext,
    .c-message_attachment__button,
    .c-message_attachment__select,
    .c-message_list__day_divider__label,
    .c-file__title,
    .c-file__meta,
    .c-reaction__count,
    .c-reaction_add__icon--fg,
    .c-input_select_options_list__option,
    .c-input_select_options_list_container:not(.c-input_select_options_list_container--always-open),
    span.c-message__body,
    a.c-message__sender_link,
    div.c-message_attachment__row,
    div.p-message_pane__foreword__description span,
    ts-conversation.message_container ts-message .message_content .message_sender,
    span.c-message_attachment__media_trigger.c-message_attachment__media_trigger--caption
    {
      color: #afafaf !important;
    }

    `

    // Insert a style tag into the wrapper view
    cssPromise.then(css => {
      let s = document.createElement('style');
      s.type = 'text/css';
      s.innerHTML = css + customCustomCSS;
      document.head.appendChild(s);
    });

    // Wait for each webview to load
    webviews.forEach(webview => {
      webview.addEventListener('ipc-message', message => {
          if (message.channel == 'didFinishLoading')
            // Finally add the CSS into the webview
            cssPromise.then(css => {
                let script = `
                      let s = document.createElement('style');
                      s.type = 'text/css';
                      s.id = 'slack-custom-css';
                      s.innerHTML = \`${css + customCustomCSS}\`;
                      document.head.appendChild(s);
                      `
                webview.executeJavaScript(script);
            })
      });
    });
});

