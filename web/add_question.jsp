<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LNMIIT Quiz Portal</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

    <link rel="stylesheet" href="bootstrap/css/custom-theme.css">


    <!-- Latest compiled and minified JavaScript -->
    <script src="bootstrap/js/jquery-2.2.2.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <header>

    </header>
    <form class="form-horizontal">
        <fieldset>
            <legend>Add Question</legend>
            <div class="form-group">
                <label for="inputQuestionText" class="col-lg-2 control-label">Question Text</label>
                <div class="col-lg-10">
                    <input type="text" name="question_text" class="form-control" id="inputQuestionText"
                           placeholder="Text">
                </div>
            </div>
            <div class="form-group">
                <label for="select" class="col-lg-2 control-label">Select Topic</label>
                <div class="col-lg-10">
                    <select class="form-control" id="select">
                        <option disabled="disabled" selected="selected">Select Topic</option>
                        <option>Java</option>
                        <option>C++</option>
                        <option>Python Programing</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="inputChoice_1" class="col-lg-2 control-label">Choice 1</label>
                <div class="col-sm-8">
                    <input type="text" name="choice1_text" class="form-control" id="inputChoice_1" placeholder="Choice Text">
                </div>
                <div class="col-sm-2 text-left">
                    <label>
                        <input type="radio" name="correct_choice" value="1">
                        Correct Answer
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="inputChoice_2" class="col-lg-2 control-label">Choice 2</label>
                <div class="col-sm-8">
                    <input type="text" name="choice2_text" class="form-control" id="inputChoice_2" placeholder="Choice Text">
                </div>
                <div class="col-sm-2 text-left">
                    <label>
                        <input type="radio" name="correct_choice" value="2">
                        Correct Answer
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="inputChoice_3" class="col-lg-2 control-label">Choice 3</label>
                <div class="col-sm-8">
                    <input type="text" name="choice3_text" class="form-control" id="inputChoice_3" placeholder="Choice Text">
                </div>
                <div class="col-sm-2 text-left">
                    <label>
                        <input type="radio" name="correct_choice" value="3">
                        Correct Answer
                    </label>
                </div>
            </div>
            <div class="form-group">
                <label for="inputChoice_4" class="col-lg-2 control-label">Choice 4</label>
                <div class="col-sm-8">
                    <input type="text" name="choice4_text" class="form-control" id="inputChoice_4" placeholder="Choice Text">
                </div>
                <div class="col-sm-2 text-left">
                    <label>
                        <input type="radio" name="correct_choice" value="4">
                        Correct Answer
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-lg-10 col-lg-offset-5">
                    <button type="reset" class="btn btn-default">Reset</button>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
<script>
    $('.nav-collapse').click('li', function () {
        $('.nav-collapse').collapse('hide');
    });
</script>
</html>