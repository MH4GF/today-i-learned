/* ALBの固定レスポンスでHTMLが返したかった */
/* file関数で実現できた */
/* https://www.terraform.io/docs/configuration/functions/file.html */
/* 変数を使いたい場合はtemplatefileを使うと良さそう */
resource "aws_lb_listener_rule" "maintainance" {
  listener_arn = module.alb_app.alb_http_listener_arn
  priority     = 1000

  action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/html"
      status_code  = "503"
      message_body = file("response.html")
    }
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}
