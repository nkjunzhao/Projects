from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, BooleanField, SubmitField, DateField
from wtforms.validators import DataRequired, Email, EqualTo, Optional

class LoginForm(FlaskForm):
    #username = StringField('Username', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Password', validators=[DataRequired()])
    submit = SubmitField('Signin')

class RegisterForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Email()])
    first_name = StringField('First Name', validators=[DataRequired()])
    middle_name = StringField('Middle Name')
    last_name = StringField('Last Name', validators=[DataRequired()])
    birthday = DateField('Birthday', validators=[Optional()], format='%Y-%m-%d')
    fhir_id = StringField('Patient ID', validators=[DataRequired()])
    password = PasswordField('Password', validators=[DataRequired(), EqualTo('re_password', message='Passwords must match')])
    re_password = PasswordField('Re-enter your password', validators=[DataRequired()])
    submit = SubmitField('Register')

    def comparePassword(password, re_password):
        #Todo implement to check password
        return True
