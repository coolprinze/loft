import React, { Component } from 'react';
import { FormFeedback, Input } from 'reactstrap';
import validator from 'validator';

type inputProps = {
  isRequired?: boolean;
  required?: boolean;
  isEmail?: boolean;
  isPhoneNumber?: boolean;
  isPassword?: boolean;
  value: any;
};

class TextValidator extends Component<inputProps> {
  state = {
    isValid: {},
    feedBack: ''
  };
  render() {
    const {
      isEmail,
      isPhoneNumber,
      isPassword,
      value,
      ...rest
    } = this.props;

    return (
      <>
        <Input
          onKeyUp={() => this.errorText()}
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
        {this.state.feedBack}
      </>
    );
  }

  changeState = (valid: boolean | undefined, feedBack: string = "") => {
    this.setState({ isValid: { valid, invalid: valid === undefined ? undefined : !valid } });
    this.setState({
      feedBack: valid ? '' : <FormFeedback>{feedBack}</FormFeedback>
    });
  };

  errorText() {
    const {
      isRequired,
      required,
      isEmail,
      isPhoneNumber,
      isPassword,
      value
    } = this.props;

    const otherConditions = () => {
      if (isEmail) {
        this.changeState(validator.isEmail(value), 'Invalid email address');
      } else if (isPhoneNumber) {
        this.changeState(
          validator.isMobilePhone(value, 'any'),
          'Invalid phone number'
        );
      } else if (isPassword) {
        this.changeState(
          validator.isLength(value, { min: 6 }),
          'Password must be at least 6 characters'
        );
      } else {
        this.changeState(undefined);
      }
    };

    if (isRequired || required) {
      if (validator.isEmpty(value)) {
        this.changeState(false, 'this feild is required');
      } else {
        otherConditions();
      }
    } else {
      otherConditions();
    }
  }
}

export default TextValidator;
