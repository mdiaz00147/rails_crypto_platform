module EmailNotification
    require 'sendgrid-ruby'
    include SendGrid
    @@global_logo = '
        <img 
            src="https://admin44.cryptobusinesscompany.com/img/cbc-logo.png" 
            style="display:block;width:100%;height:auto;margin-top: -51px;" 
        >'


    def self.subscription_expired(user)
        @user     = user
        from      = Email.new(email: 'noreply@cryptobusinesscompany.com')
        to        = Email.new(email: @user.email)
        subject   = 'Crypto Business Company :: Your subscription has expired'

        content   = Content.new(type: 'text/html', value: '
        <!DOCTYPE html>
        <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
        <head>
            <title></title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style type="text/css">
                .ReadMsgBody {
                    width: 100%;
                }
                .ExternalClass {
                    width: 100%;
                }
                .ExternalClass * {
                    line-height: 100%;
                }
                body {
                    margin: 0;
                    padding: 0;
                    -webkit-text-size-adjust: 100%;
                    -ms-text-size-adjust: 100%;
                }

                table,
                td {
                    border-collapse: collapse;
                }

                img {
                    border: 0;
                    height: auto;
                    line-height: 100%;
                    outline: none;
                    text-decoration: none;
                    -ms-interpolation-mode: bicubic;
                }

                p {
                    display: block;
                    margin: 13px 0;
                }
            </style>
            <style type="text/css">
                @media only screen and (max-width:480px) {
                    @viewport {
                        width: 320px;
                    }
                }
            </style>
            <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700" rel="stylesheet" type="text/css">
            <style type="text/css">
                @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);
            </style>
        </head>

        <body style="background: transparent !important;">
            <div style="background-color:transparent;">
                <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" border="0">
                    <tbody>
                        <tr>
                            <td>
                                <div style="margin:0px auto;max-width:600px;">
                                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                    <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                                        <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:left;">
                                                                            <p>
                                                                                <span style="color:#17284c;">
                                                                                </span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="word-wrap:break-word;font-size:0px;padding-top:40px" align="center">
                                                                        <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-spacing:0px;" align="center" border="0">
                                                                            <tbody>
                                                                                <tr>

                                                                                <td style="width:200px;">
                                                                                        ' + @@global_logo + '
                                                                                    </td>

                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="margin:0px auto;max-width:600px;">
                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                        <tbody>
                            <tr>
                                <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                    <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;">
                                                        <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                        <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                            <h2 style="line-height: 100%;">
                                                                <span style="color:#17284c;">
                                                                    <span style="font-size:22px;">Your subscription has expired</span>
                                                                </span>
                                                                <br>&#xA0;</h2>
                                                            <p></p>
                                                            <p>
                                                                <span style="font-size:20px;">
                                                                Your account has been disabled. Please renew your subscription to activate your account.                                                                   </span>
                                                            </p>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:13px 25px 13px 25px;padding-top:10px;padding-left:25px;" align="center">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;" align="center" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="border:none;border-radius:none;color:#fff;cursor:auto;padding:10px 25px;" align="center" valign="middle" bgcolor="#17284c">
                                                                        <a href="https://app.cryptobusinesscompany.com/#/login" style="text-decoration:none;background:#17284c;color:#fff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:19px;font-weight:normal;line-height:120%;text-transform:none;margin:0px;" target="_blank"> Login </a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:12px;padding-bottom:12px;padding-right:9px;padding-left:9px;">
                                                        <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;" align="center">
                                                        <div>
                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="padding:4px;vertical-align:middle;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                            <a href="https://www.facebook.com/Trading Waves-135725870448427/">
                                                                                                <img alt="facebook" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/facebook.png" style="display:block;border-radius:3px;" width="35">
                                                                                            </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                        <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                            <a href="https://www.facebook.com/Trading Waves-135725870448427/" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="padding:4px;vertical-align:middle;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                            <a href="https://twitter.com/Trading Waves2">
                                                                                                <img alt="twitter" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/twitter.png" style="display:block;border-radius:3px;" width="35">
                                                                                            </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                        <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                            <a href="https://twitter.com/Trading Waves2" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                        <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                            <p>You are receiving this email because you have Trading Waves&#xA0;account.
                                                                <br>If you have got this message in error or do not wish to receive any further communications, please contact support.
                                                                <br>2018 Trading Waves. All rights reserved.</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </body>

        </html>')

        mail  = Mail.new(from, subject, to, content)
        sg    = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api)
        response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    def self.send_confirmation_email_temp(temp_email, temp_username ,password)
        from      = Email.new(email: 'noreply@cryptobusinesscompany.com')
        to        = Email.new(email: temp_email)
        subject   = 'Crypto Business Company :: Registration completed'
        shref     = Rails.application.secrets.temp_confirm_route + temp_username

        content   = Content.new(type: 'text/html', value:'
            <!DOCTYPE html>
            <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
            <head>
                <title></title>
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <style type="text/css">
                    .ReadMsgBody {
                        width: 100%;
                    }

                    .ExternalClass {
                        width: 100%;
                    }

                    .ExternalClass * {
                        line-height: 100%;
                    }

                    body {
                        margin: 0;
                        padding: 0;
                        -webkit-text-size-adjust: 100%;
                        -ms-text-size-adjust: 100%;
                    }

                    table,
                    td {
                        border-collapse: collapse;
                    }

                    img {
                        border: 0;
                        height: auto;
                        line-height: 100%;
                        outline: none;
                        text-decoration: none;
                        -ms-interpolation-mode: bicubic;
                    }

                    p {
                        display: block;
                        margin: 13px 0;
                    }
                </style>
                <style type="text/css">
                    @media only screen and (max-width:480px) {
                        @viewport {
                            width: 320px;
                        }
                    }
                </style>
                <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700" rel="stylesheet" type="text/css">
                <style type="text/css">
                    @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);
                </style>
            </head>

            <body style="background: transparent !important;">
                <div style="background-color:transparent;">
                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" border="0">
                        <tbody>
                            <tr>
                                <td>
                                    <div style="margin:0px auto;max-width:600px;">
                                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:left;">
                                                                                <p>
                                                                                    <span style="color:#17284c;">
                                                                                    </span>
                                                                                </p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding-top:40px" align="center">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-spacing:0px;" align="center" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                    <td style="width:200px;">
                                                                                        ' + @@global_logo + '
                                                                                    </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="margin:0px auto;max-width:600px;">
                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;">
                                                            <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                <h2 style="line-height: 100%;">
                                                                    <span style="color:#17284c;">
                                                                        <span style="font-size:22px;">Welcome to Crypto Business Company<::span>
                                                                    </span>
                                                                    <br>&#xA0;</h2>
                                                                <p></p>
                                                                <p>
                                                                    <span style="font-size:20px;">Your account has been successfully created</span>
                                                                </p>
                                                                <p>
                                                                    <small style="font-size:20px;">Username: ' +  temp_username + ' </small>
                                                                </p>
                                                                <p>
                                                                    <small style="font-size:20px;">Password: ' +  password + '</small>
                                                                </p>
                                                                <p>
                                                                    <small style="font-size:20px;">My referral link: ' +  shref + '</small>
                                                                </p>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:12px;padding-bottom:12px;padding-right:9px;padding-left:9px;">
                                                            <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;" align="center">
                                                            <div>


                                                            </div>
                                                        </td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </body>
            </html>'
        )

        mail        = Mail.new(from, subject, to, content)
        sg          = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api)
        response    = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    def self.confirm_rewards_up(user)
        @user      = user
        from      = Email.new(email: 'noreply@cryptobusinesscompany.com')
        to        = Email.new(email: @user.email)
        subject   = 'Crypto Business Company :: congratulations you have moved up'

        content   = Content.new(type: 'text/html', value:' <!DOCTYPE html>
        <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
        <head>
            <title></title>
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style type="text/css">
                .ReadMsgBody {
                    width: 100%;
                }
                .ExternalClass {
                    width: 100%;
                }
                .ExternalClass * {
                    line-height: 100%;
                }
                body {
                    margin: 0;
                    padding: 0;
                    -webkit-text-size-adjust: 100%;
                    -ms-text-size-adjust: 100%;
                }

                table,
                td {
                    border-collapse: collapse;
                }

                img {
                    border: 0;
                    height: auto;
                    line-height: 100%;
                    outline: none;
                    text-decoration: none;
                    -ms-interpolation-mode: bicubic;
                }

                p {
                    display: block;
                    margin: 13px 0;
                }
            </style>
            <style type="text/css">
                @media only screen and (max-width:480px) {
                    @viewport {
                        width: 320px;
                    }
                }
            </style>
            <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700" rel="stylesheet" type="text/css">
            <style type="text/css">
                @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);
            </style>
        </head>

        <body style="background: transparent !important;">
            <div style="background-color:transparent;">
                <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" border="0">
                    <tbody>
                        <tr>
                            <td>
                                <div style="margin:0px auto;max-width:600px;">
                                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                        <tbody>
                                            <tr>
                                                <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                    <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                                        <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:left;">
                                                                            <p>
                                                                                <span style="color:#17284c;">
                                                                                    <span style="font-size:26px;">Dear customer!</span>
                                                                                </span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                    <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 0px 0px 0px;" align="center">
                                                                        <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-spacing:0px;" align="center" border="0">
                                                                            <tbody>
                                                                                <tr>

                                                                                <td style="width:200px;">
                                                                                        ' + @@global_logo + '
                                                                                    </td>

                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div style="margin:0px auto;max-width:600px;">
                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                        <tbody>
                            <tr>
                                <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                    <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                        <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;">
                                                        <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                        <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                            <h2 style="line-height: 100%;">
                                                                <span style="color:#17284c;">
                                                                    <span style="font-size:22px;">congratulations</span>
                                                                </span>
                                                                <br>&#xA0;</h2>
                                                            <p></p>
                                                            <p>
                                                                <span style="font-size:20px;">
                                                                    You new level is <b>' + @user.reward_depth_name + '</b>
                                                                </span>
                                                            </p>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:13px 25px 13px 25px;padding-top:10px;padding-left:25px;" align="center">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;" align="center" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="border:none;border-radius:none;color:#fff;cursor:auto;padding:10px 25px;" align="center" valign="middle" bgcolor="#17284c">
                                                                        <a href="https://app.cryptobusinesscompany.com/#/login" style="text-decoration:none;background:#17284c;color:#fff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:19px;font-weight:normal;line-height:120%;text-transform:none;margin:0px;" target="_blank"> Login </a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:12px;padding-bottom:12px;padding-right:9px;padding-left:9px;">
                                                        <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;" align="center">
                                                        <div>
                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="padding:4px;vertical-align:middle;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                            <a href="https://www.facebook.com/Crypto Business Company-::35725870448427/">
                                                                                                <img alt="facebook" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/facebook.png" style="display:block;border-radius:3px;" width="35">
                                                                                            </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                        <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                            <a href="https://www.facebook.com/Crypto Business Company-::35725870448427/" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="padding:4px;vertical-align:middle;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                            <a href="https://twitter.com/Crypto Business Company2::>
                                                                                                <img alt="twitter" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/twitter.png" style="display:block;border-radius:3px;" width="35">
                                                                                            </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                        <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                            <a href="https://twitter.com/Crypto Business Company2:: style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                        <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                            <p>You are receiving this email because you have Crypto Business Company&::xA0;account.
                                                                <br>If you have got this message in error or do not wish to receive any further communications, please contact support.
                                                                <br>2018 Crypto Business Company.::All rights reserved.</p>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </body>

        </html>')

        mail  = Mail.new(from, subject, to, content)
        sg    = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api)
        response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    def self.send_notification(invoice)
        subject_message = 'New Subscription'
        from      = Email.new(email: 'noreply@cryptobusinesscompany.com')
        to        = Email.new(email: invoice.user.email)
        subject   = "Crypto Business Company :: #{subject_message}"
        content   = Content.new(type: 'text/html', value:'
                            <!DOCTYPE html>
                                <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
                                <head>
                                    <title></title>
                                    <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                    <style type="text/css">
                                        .ReadMsgBody {
                                            width: 100%;
                                        }

                                        .ExternalClass {
                                            width: 100%;
                                        }

                                        .ExternalClass * {
                                            line-height: 100%;
                                        }

                                        body {
                                            margin: 0;
                                            padding: 0;
                                            -webkit-text-size-adjust: 100%;
                                            -ms-text-size-adjust: 100%;
                                        }

                                        table,
                                        td {
                                            border-collapse: collapse;
                                        }

                                        img {
                                            border: 0;
                                            height: auto;
                                            line-height: 100%;
                                            outline: none;
                                            text-decoration: none;
                                            -ms-interpolation-mode: bicubic;
                                        }

                                        p {
                                            display: block;
                                            margin: 13px 0;
                                        }
                                    </style>
                                    <style type="text/css">
                                        @media only screen and (max-width:480px) {
                                            @viewport {
                                                width: 320px;
                                            }
                                        }
                                    </style>
                                    <style type="text/css">
                                        .promos {
                                            margin: 50px auto;
                                        }

                                        .promo {
                                            width: 60%;
                                            background: #fff;
                                            color: #fff;
                                            padding-bottom: 10px;
                                            box-shadow: 0 0 15px rgba(0, 0, 0, 0.05);
                                            -webkit-transition-duration: 0.05s;
                                            transition-duration: 0.05s;
                                        }

                                        .promo:hover {
                                            box-shadow: 2px 4px 17px 4px #d1d1d1;
                                            -webkit-box-shadow: 2px 4px 17px 4px #d1d1d1;
                                        }

                                        .ic {
                                            display: block;
                                            position: absolute;
                                            top: -40px;
                                            left: 50%;
                                            margin-left: -40px;
                                            border-radius: 200px;
                                            font-size: 30px;
                                            font-weight: bold;
                                            color: #fff;
                                            padding: 19px 0;
                                            width: 80px;
                                            height: 80px;
                                            box-sizing: border-box;
                                            text-align: center;
                                        }

                                        .deal {
                                            padding: 50px 10px -2px;
                                            position: relative;
                                        }

                                        .features {
                                            display: block;
                                            margin: 20px 0 10px 0;
                                            padding: 0;
                                            list-style-type: none;
                                            text-align: center;
                                            color: #999999;
                                        }

                                        .features li {
                                            display: block;
                                            padding: 10px 0;
                                            border-bottom: 1px solid #efefef;
                                        }

                                        .plan-1 .ic,
                                        .plan-1 .promo .price {
                                            background-color: #17284c;
                                        }
                                    </style>
                                    <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700" rel="stylesheet" type="text/css">
                                    <style type="text/css">
                                        @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);
                                    </style>
                                    <style type="text/css">
                                        @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
                                    </style>
                                </head>

                                <body style="background: transparent !important;">
                                    <div style="background-color:transparent;">
                                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" border="0">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <div style="margin:0px auto;max-width:600px;">
                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                                            <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                                                                <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:left;">
                                                                                                    <p>
                                                                                                        <span style="color:#17284c;">
                                                                                                        </span>
                                                                                                    </p>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                            <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="word-wrap:break-word;font-size:0px;padding-top:40px" align="center">
                                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-spacing:0px;" align="center" border="0">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                        <td style="width:200px;">
                                                                                                            ' + @@global_logo + '
                                                                                                        </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div style="margin:0px auto;max-width:600px;">
                                            <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                            <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                    <tbody>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;">
                                                                                <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                                <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                    <h2 style="line-height: 100%;">

                                                                                        <span style="font-size:22px;">Your payment for plan ' + invoice.plan.name +  '  has been recieved</span>
                                                                                        </span>
                                                                                        <br>&#xA0;</h2>
                                                                                    <p></p>

                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                                <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                    <h2 style="line-height: 100%;">

                                                                                        <span style="font-size:12px;">Txid: ' + invoice.txid +  '  </span>
                                                                                        </span>
                                                                                        <br>&#xA0;</h2>
                                                                                    <p></p>

                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                                <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                    <h2 style="line-height: 100%;">

                                                                                        <span style="font-size:12px;">Plan price: $' + invoice.plan.price.to_s +  ' USD </span>
                                                                                        </span>
                                                                                        <br>&#xA0;</h2>
                                                                                    <p></p>

                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:13px 25px 13px 25px;padding-top:10px;padding-left:25px;" align="center">
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;" align="center" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="border:none;border-radius:none;color:#fff;cursor:auto;padding:10px 25px;" align="center" valign="middle" bgcolor="#17284c">
                                                                                                <a href="https://app.cryptobusinesscompany.com/#/login" style="text-decoration:none;background:#17284c;color:#fff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:19px;font-weight:normal;line-height:120%;text-transform:none;margin:0px;" target="_blank"> Login </a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:12px;padding-bottom:12px;padding-right:9px;padding-left:9px;">
                                                                                <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;" align="center">
                                                                                <div>
                                                                                    <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td style="padding:4px;vertical-align:middle;">
                                                                                                    <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                                                    <a href=" https://www.facebook.com/Crypto Business Company-::">
                                                                                                                        <img alt="facebook" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/facebook.png" style="display:block;border-radius:3px;" width="35">
                                                                                                                    </a>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                                                    <a href=" https://www.facebook.com/Crypto Business Company-::" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                    <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                                        <tbody>
                                                                                            <tr>
                                                                                                <td style="padding:4px;vertical-align:middle;">
                                                                                                    <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                                        <tbody>
                                                                                                            <tr>
                                                                                                                <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                                                    <a href="https://twitter.com/Trading Waves2">
                                                                                                                        <img alt="twitter" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/twitter.png" style="display:block;border-radius:3px;" width="35">
                                                                                                                    </a>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </tbody>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                                                    <a href="https://twitter.com/Trading Waves2" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                                <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                    <p>You are receiving this email because you have Crypto Business Company&::xA0;account.
                                                                                        <br>If you have got this message in error or do not wish to receive any further communications, please contact support.
                                                                                        <br>2018 Crypto Business Company.::All rights reserved.</p>
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </body>

                                </html>


                            ')
        mail  = Mail.new(from, subject, to, content)
        sg    = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api)
        response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    def self.send_recovery_email(user,new_password)
        @new_password = new_password
        @user         = user
        from      = Email.new(email: 'noreply@cryptobusinesscompany.com')
        to        = Email.new(email: @user.email)
        subject   = 'Crypto Business Company :: Password recovery'

        content   = Content.new(type: 'text/html', value:'
                            <!DOCTYPE html>
                            <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">
                            <head>
                                <title></title>
                                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <style type="text/css">
                                    .ReadMsgBody {
                                        width: 100%;
                                    }
                                    .ExternalClass {
                                        width: 100%;
                                    }
                                    .ExternalClass * {
                                        line-height: 100%;
                                    }
                                    body {
                                        margin: 0;
                                        padding: 0;
                                        -webkit-text-size-adjust: 100%;
                                        -ms-text-size-adjust: 100%;
                                    }

                                    table,
                                    td {
                                        border-collapse: collapse;
                                    }

                                    img {
                                        border: 0;
                                        height: auto;
                                        line-height: 100%;
                                        outline: none;
                                        text-decoration: none;
                                        -ms-interpolation-mode: bicubic;
                                    }

                                    p {
                                        display: block;
                                        margin: 13px 0;
                                    }
                                </style>
                                <style type="text/css">
                                    @media only screen and (max-width:480px) {
                                        @viewport {
                                            width: 320px;
                                        }
                                    }
                                </style>
                                <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700" rel="stylesheet" type="text/css">
                                <style type="text/css">
                                    @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);
                                </style>
                            </head>

                            <body style="background: transparent !important;">
                                <div style="background-color:transparent;">
                                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" border="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div style="margin:0px auto;max-width:600px;">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:left;">
                                                                                                <p>
                                                                                                    <span style="color:#17284c;">
                                                                                                    </span>
                                                                                                </p>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="word-wrap:break-word;font-size:0px;padding-top:40px" align="center">
                                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-spacing:0px;" align="center" border="0">
                                                                                                <tbody>
                                                                                                    <tr>

                                                                                                    <td style="width:200px;">
                                                                                                            ' + @@global_logo + '
                                                                                                        </td>

                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div style="margin:0px auto;max-width:600px;">
                                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;">
                                                                            <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                <h2 style="line-height: 100%;">
                                                                                    <span style="color:#17284c;">
                                                                                        <span style="font-size:22px;">Password recovery  Crypto Business Company.::/span>
                                                                                    </span>
                                                                                    <br>&#xA0;</h2>
                                                                                <p></p>
                                                                                <p>
                                                                                    <h2>' + @user.username + '</h2>
                                                                                </p>
                                                                                <p>
                                                                                    <span style="font-size:20px;">
                                                                                        This is the new password for your account
                                                                                    </span>
                                                                                    <br/>
                                                                                    <h1> ' + @new_password + '</h1>
                                                                                </p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:13px 25px 13px 25px;padding-top:10px;padding-left:25px;" align="center">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;" align="center" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="border:none;border-radius:none;color:#fff;cursor:auto;padding:10px 25px;" align="center" valign="middle" bgcolor="#17284c">
                                                                                            <a href="https://app.cryptobusinesscompany.com/#/login" style="text-decoration:none;background:#17284c;color:#fff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:19px;font-weight:normal;line-height:120%;text-transform:none;margin:0px;" target="_blank"> Login </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:12px;padding-bottom:12px;padding-right:9px;padding-left:9px;">
                                                                            <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;" align="center">
                                                                            <div>
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="padding:4px;vertical-align:middle;">
                                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                                                <a href="https://www.facebook.com/Crypto Business Company-::35725870448427/">
                                                                                                                    <img alt="facebook" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/facebook.png" style="display:block;border-radius:3px;" width="35">
                                                                                                                </a>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                                                <a href="https://www.facebook.com/Crypto Business Company-::35725870448427/" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="padding:4px;vertical-align:middle;">
                                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                                                <a href="https://twitter.com/Crypto Business Company2::>
                                                                                                                    <img alt="twitter" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/twitter.png" style="display:block;border-radius:3px;" width="35">
                                                                                                                </a>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                                                <a href="https://twitter.com/Crypto Business Company2:: style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                <p>You are receiving this email because you have Crypto Business Company&::xA0;account.
                                                                                    <br>If you have got this message in error or do not wish to receive any further communications, please contact support.
                                                                                    <br>2018 Crypto Business Company.::All rights reserved.</p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </body>

                            </html>')

        mail  = Mail.new(from, subject, to, content)
        sg    = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api)
        response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

    def self.send_invoice(client,invoice)
        @invoice    = invoice
        invoice     = Invoice.find_by(uuid: @invoice.uuid)
        total       = invoice.price + invoice.fees
        from      = Email.new(email: 'noreply@cryptobusinesscompany.com')
        to        = Email.new(email: client.email)
        subject   = 'Crypto Business Company :: Invoice created'

        content   = Content.new(type: 'text/html', value:'
                            <!DOCTYPE html>
                            <html xmlns="http://www.w3.org/1999/xhtml" xmlns:v="urn:schemas-microsoft-com:vml" xmlns:o="urn:schemas-microsoft-com:office:office">

                            <head>
                                <title></title>
                                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                                <style type="text/css">
                                    .ReadMsgBody {
                                        width: 100%;
                                    }

                                    .ExternalClass {
                                        width: 100%;
                                    }

                                    .ExternalClass * {
                                        line-height: 100%;
                                    }

                                    body {
                                        margin: 0;
                                        padding: 0;
                                        -webkit-text-size-adjust: 100%;
                                        -ms-text-size-adjust: 100%;
                                    }

                                    table,
                                    td {
                                        border-collapse: collapse;
                                    }

                                    img {
                                        border: 0;
                                        height: auto;
                                        line-height: 100%;
                                        outline: none;
                                        text-decoration: none;
                                        -ms-interpolation-mode: bicubic;
                                    }

                                    p {
                                        display: block;
                                        margin: 13px 0;
                                    }
                                </style>
                                <style type="text/css">
                                    .print-container {
                                        max-width: 900px;
                                        margin: 30px auto;
                                        background: white;
                                        padding: 10px 30px;
                                        .header {
                                            margin-bottom: 20px;
                                            border-bottom: 1px solid #dbdbdb;
                                            padding-bottom: 20px;
                                        }
                                        table {
                                            margin-top: 30px;
                                            tbody tr.no-border:first-child {
                                                opacity: 0.6!important;
                                            }
                                        }
                                        .summary-table {
                                            border: 1px solid #DDE1E4;
                                            & tr td:last-child {
                                                text-align: right;
                                            }
                                            & tr th:last-child {
                                                text-align: right;
                                            }
                                            td {
                                                border-left: 1px solid #dbdbdb;
                                            }
                                            th {
                                                border-left: 1px solid #dbdbdb;
                                            }
                                            thead {
                                                color: #737F8B;
                                                text-transform: uppercase;
                                            }
                                        }
                                        .ft-18 {
                                            font-size: 20px;
                                            margin-bottom: 10px;
                                        }
                                        .adder {
                                            font-size: 16px;
                                            font-weight: 500;
                                            text-align: right;
                                            border-left: 0;
                                            border-right: 0;
                                            border-bottom: 0;
                                        }
                                        .total {
                                            font-size: 22px;
                                        }
                                        .mega {
                                            font-size: 33px;
                                            margin-bottom: 10px;
                                        }
                                    }

                                    .invoice-logo {
                                        height: 80px;
                                        width: auto;
                                    }

                                    .other-rates {
                                        float: right;
                                        width: 350px;
                                        text-align: right;
                                        dl {
                                            width: 100%;
                                            margin-bottom: 5px;
                                            &.total {
                                                border-top: 1px solid #dbdbdb;
                                                padding-top: 10px;
                                            }
                                        }
                                        dt {
                                            width: 50%;
                                            float: left;
                                        }
                                        dd {
                                            width: 50%;
                                            float: left;
                                            padding-right: 10px;
                                            margin: 0;
                                        }
                                    }

                                    .invoice-from {
                                        float: right;
                                    }

                                    .summary-info {
                                        border-bottom: 1px solid #dbdbdb;
                                        margin-bottom: 20px;
                                        padding-bottom: 10px;
                                    }

                                    @media print {
                                        .print-container {}
                                        h1,
                                        h2,
                                        h3,
                                        h4,
                                        h5,
                                        h6 {
                                            font-weight: bold;
                                            &:first-letter {
                                                font-size: inherit;
                                            }
                                        }
                                    }
                                </style>
                                <style type="text/css">
                                    @media only screen and (max-width:480px) {
                                        @viewport {
                                            width: 320px;
                                        }
                                    }
                                </style>
                                <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700" rel="stylesheet" type="text/css">
                                <style type="text/css">
                                    @import url(https://fonts.googleapis.com/css?family=Ubuntu:300,400,500,700);
                                    @import url(https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css);
                                </style>
                            </head>

                            <body style="background: transparent !important;">
                                <div style="background-color:transparent;">
                                    <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" border="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div style="margin:0px auto;max-width:600px;">
                                                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="left">
                                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:left;">
                                                                                                <p>
                                                                                                    <span style="color:#17284c;">
                                                                                                    </span>
                                                                                                </p>
                                                                                            </div>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="word-wrap:break-word;font-size:0px;padding-top:40px;" align="center">
                                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:collapse;border-spacing:0px;" align="center" border="0">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                    <td style="width:200px;">
                                                                                                        ' + @@global_logo + '                                                                                                 </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div style="margin:0px auto;max-width:600px;">
                                        <table role="presentation" cellpadding="0" cellspacing="0" style="font-size:0px;width:100%;" align="center" border="0">
                                            <tbody>
                                                <tr>
                                                    <td style="text-align:center;vertical-align:top;direction:ltr;font-size:0px;padding:9px 0px 9px 0px;">
                                                        <div style="vertical-align:top;display:inline-block;direction:ltr;font-size:13px;text-align:left;width:100%;">
                                                            <table role="presentation" cellpadding="0" cellspacing="0" width="100%" border="0">
                                                                <tbody>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:10px;padding-bottom:10px;padding-right:10px;padding-left:10px;">
                                                                            <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                <h2 style="line-height: 100%;">
                                                                                    <span style="color:#17284c;">
                                                                                        <span style="font-size:22px;">Invoice for Payment plan - '  + invoice.plan.name +  '</span>
                                                                                    </span>
                                                                                    <br>&#xA0;</h2>
                                                                                <p></p>
                                                                                <p>
                                                                                    <span style="font-size:20px;">
                                                                                        This is your plan payment support. It is important that you contact us if you have any problems.
                                                                                    </span>
                                                                                    <span style="font-size: 20px;">
                                                                                        <b>Plans activate Time after purchase</b>
                                                                                    </span>
                                                                                    <div class="print-container" style="font-size: 16px;">
                                                                                        <div class="body">
                                                                                            <h4 style="font-size: 26px;">Summary</h4>
                                                                                            <div class="summary-info" style="margin-left: 20px">
                                                                                                <table class="table summary-table">
                                                                                                    <thead>

                                                                                                    </thead>
                                                                                                    <tbody>

                                                                                                    </tbody>
                                                                                                </table>
                                                                                                <div class="row">
                                                                                                    <div class="col-md-12">
                                                                                                        <div class="other-rates clearfix">
                                                                                                            <dl class="dl-horizontal clearfix">
                                                                                                                <dt>Price</dt>
                                                                                                                <dd>' + invoice.price.to_s + ' ' + invoice.currency.name.to_s + '</dd>
                                                                                                            </dl>
                                                                                                            <dl class="dl-horizontal clearfix">
                                                                                                                <dt>Fees</dt>
                                                                                                                <dd>' + invoice.fees.to_s + ' ' + invoice.currency.name.to_s + '</dd>
                                                                                                            </dl>
                                                                                                            <dl class="dl-horizontal total clearfix">
                                                                                                                <dt class="blue">Total</dt>
                                                                                                                <dd>' + total.to_s + ' ' + invoice.currency.name.to_s + '</dd>
                                                                                                            </dl>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>

                                                                                            <h4>Details</h4>
                                                                                            <div class="break-d">
                                                                                                <p><strong>Vendor Name:</strong> cryptobusinesscompany.com
                                                                                                    <br />
                                                                                                    <strong>Invoice No:</strong> ' + invoice.uuid + '
                                                                                                </p>
                                                                                                <br />
                                                                                                <br />
                                                                                                <strong>Payment wallet</strong>
                                                                                                <br />
                                                                                                <p>' + invoice.wallet + '</p>
                                                                                            </div>

                                                                                        </div>

                                                                                    </div>
                                                                                </p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:13px 25px 13px 25px;padding-top:10px;padding-left:25px;" align="center">
                                                                            <table role="presentation" cellpadding="0" cellspacing="0" style="border-collapse:separate;" align="center" border="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td style="border:none;border-radius:none;color:#fff;cursor:auto;padding:10px 25px;" align="center" valign="middle" bgcolor="#17284c">
                                                                                            <a href="https://app.cryptobusinesscompany.com/#/login" style="text-decoration:none;background:#17284c;color:#fff;font-family:Ubuntu, Helvetica, Arial, sans-serif, Helvetica, Arial, sans-serif;font-size:19px;font-weight:normal;line-height:120%;text-transform:none;margin:0px;" target="_blank">  Login Crypto Business Company </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;padding-top:12px;padding-bottom:12px;padding-right:9px;padding-left:9px;">
                                                                            <p style="font-size:1px;margin:0px auto;border-top:4px solid #17284c;width:100%;"></p>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:10px 25px;" align="center">
                                                                            <div>
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="padding:4px;vertical-align:middle;">
                                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                                                <a href=" https://www.facebook.com/Crypto Business Company-::35725870448427/">
                                                                                                                    <img alt="facebook" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/facebook.png" style="display:block;border-radius:3px;" width="35">
                                                                                                                </a>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                                                <a href=" https://www.facebook.com/Crypto Business Company-::35725870448427/" style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="float:none;display:inline-table;" align="center" border="0">
                                                                                    <tbody>
                                                                                        <tr>
                                                                                            <td style="padding:4px;vertical-align:middle;">
                                                                                                <table role="presentation" cellpadding="0" cellspacing="0" style="background:none;border-radius:3px;width:35px;" border="0">
                                                                                                    <tbody>
                                                                                                        <tr>
                                                                                                            <td style="vertical-align:middle;width:35px;height:35px;">
                                                                                                                <a href="https://twitter.com/Crypto Business Company2::>
                                                                                                                    <img alt="twitter" height="35" src="https://s3-eu-west-1.amazonaws.com/ecomail-assets/editor/social-icos/outlined/twitter.png" style="display:block;border-radius:3px;" width="35">
                                                                                                                </a>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </tbody>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td style="padding:4px 4px 4px 0;vertical-align:middle;">
                                                                                                <a href="https://twitter.com/Crypto Business Company2:: style="text-decoration:none;text-align:left;display:block;color:#333333;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:13px;line-height:22px;border-radius:3px;"></a>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>
                                                                                </table>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="word-wrap:break-word;font-size:0px;padding:0px 20px 0px 20px;" align="center">
                                                                            <div style="cursor:auto;color:#000000;font-family:Ubuntu, Helvetica, Arial, sans-serif;font-size:11px;line-height:22px;text-align:center;">
                                                                                <p>You are receiving this email because you have Crypto Business Company&::xA0;account.
                                                                                    <br>If you have got this message in error or do not wish to receive any further communications, please contact support.
                                                                                    <br>2018 Crypto Business Company.::All rights reserved.</p>
                                                                            </div>
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </body>
                        </html>')
        mail  = Mail.new(from, subject, to, content)
        sg    = SendGrid::API.new(api_key: Rails.application.secrets.sendgrid_api)
        response = sg.client.mail._('send').post(request_body: mail.to_json)
    end

end