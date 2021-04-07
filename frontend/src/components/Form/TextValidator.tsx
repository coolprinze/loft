import React, { Component } from 'react'
import PhoneInput from 'react-phone-input-2'
import { FormFeedback, Input } from 'reactstrap'
import validator from 'validator'

type inputProps = {
  isRequired?: boolean
  required?: boolean
  isEmail?: boolean
  isPhoneNumber?: boolean
  isPassword?: boolean
  invalid?: boolean
  value: any
}

class TextValidator extends Component<inputProps> {
  state = {
    isValid: { valid: false, invalid: false },
    feedBack: '',
  }
  componentDidUpdate() {
    if (this.props.invalid && this.state.isValid.invalid === false)
      this.changeState(false, 'this field is required')
    else return null
  }
  render() {
    const {
        isRequired,
        isEmail,
        isPhoneNumber,
        isPassword,
        value,
        ...rest
      } = this.props,
      {
        isValid: { valid, invalid },
      } = this.state

    return (
      <>
        {isPhoneNumber ? (
          <PhoneInput
            specialLabel={''}
            country={'ng'}
            value={value}
            inputProps={{
              ...rest,
              onKeyUp: () =>
                isRequired || rest.required ? this.errorText() : null,
            }}
            inputClass={`w-100 ${
              valid ? 'is-valid' : invalid ? 'is-invalid' : ''
            }`}
          />
        ) : (
          <Input
            onKeyUp={() =>
              isRequired || rest.required ? this.errorText() : null
            }
            type={
              isPhoneNumber
                ? 'tel'
                : isEmail
                ? 'email'
                : isPassword
                ? 'password'
                : 'text'
            }
            value={value === null ? '' : value}
            {...rest}
            {...this.state.isValid}
          />
        )}
        {this.state.feedBack}
      </>
    )
  }

  changeState = (valid: boolean, feedBack: string) => {
    this.setState({ isValid: { invalid: !valid, valid } })
    this.setState({
      feedBack: valid ? (
        ''
      ) : (
        <FormFeedback style={{ display: 'block' }}>{feedBack}</FormFeedback>
      ),
    })
  }

  errorText() {
    const {
      isRequired,
      required,
      isEmail,
      isPhoneNumber,
      isPassword,
      value,
    } = this.props

    const otherConditions = () => {
      if (isEmail) {
        this.changeState(validator.isEmail(value), 'Invalid email address')
      } else if (isPhoneNumber) {
        this.changeState(
          validator.isMobilePhone(value.replaceAll(' ', ''), 'any'),
          'Invalid phone number'
        )
      } else if (isPassword) {
        this.changeState(
          validator.isLength(value, { min: 6 }),
          'Password must be at least 6 characters'
        )
      } else {
        this.changeState(true, '')
      }
    }

    if (isRequired || required) {
      if (validator.isEmpty(value.toString())) {
        this.changeState(false, 'this field is required')
      } else {
        otherConditions()
      }
    } else {
      otherConditions()
    }
  }
}

export default TextValidator
