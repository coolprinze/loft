import React from "react";
import Datetime from "react-datetime";
import {
  Col,
  CustomInput,
  FormGroup,
  InputGroup,
  InputGroupAddon,
  InputGroupText,
  Label,
} from "reactstrap";
import { ColProps } from "reactstrap/lib/Col";
import { CustomInputProps } from "reactstrap/lib/CustomInput";
import validator from "validator";
import "./style.css";
import TextValidator from "./TextValidator";

export const TextInputGroup = ({ iconClass = "", label = "", ...rest }) => {
  return (
    <>
      {!validator.isEmpty(label) ? (
        <label className="form-control-label mt-2" htmlFor={rest.name}>
          {label}
          {rest.required && <span className="text-danger">*</span>}
        </label>
      ) : (
          <></>
        )}
      <TextValidator value {...rest} />
      {rest.subText && <small>{rest.subText}</small>}
    </>
  );
};

export const FileInput = ({ iconClass = "", label = "", ...rest }) => {
  return (
    <FormGroup className="mb-2">
      {!validator.isEmpty(label) ? (
        <label className="form-control-label mt-2" htmlFor={rest.name}>
          {label}
          {rest.required && <span className="text-danger">*</span>}
        </label>
      ) : (
          <></>
        )}
      <InputGroup className="input-group-alternative">
        {!validator.isEmpty(iconClass) ? (
          <InputGroupAddon addonType="prepend">
            <InputGroupText>
              <i className={iconClass} />
            </InputGroupText>
          </InputGroupAddon>
        ) : (
            ""
          )}
        <CustomInput id={rest.name}
          type="file"
          {...rest}
          label={rest.customLabel ? rest.customLabel : "Choose file"}
        />
      </InputGroup>
      {rest.subText && <small>{rest.subText}</small>}
    </FormGroup>
  );
};

export const DateInputGroup = ({
  onChange = (e: any) => { },
  iconClass = "",
  label = "",
  value = "",
  ...rest
}) => {
  return (
    <FormGroup className="mb-2">
      {!validator.isEmpty(label) ? (
        <label className="form-control-label mt-2" htmlFor={rest.name}>
          {label}
          {rest.required && <span className="text-danger">*</span>}
        </label>
      ) : (
          <></>
        )}
      <InputGroup className="input-group-alternative">
        {!validator.isEmpty(iconClass) ? (
          <InputGroupAddon addonType="prepend">
            <InputGroupText>
              <i className={iconClass} />
            </InputGroupText>
          </InputGroupAddon>
        ) : (
            ""
          )}
        <Datetime
          onChange={onChange}
          closeOnSelect
          timeFormat={false}
          value={value}
          {...rest}
        />
      </InputGroup>
    </FormGroup>
  );
};

export type radioOptions = {
  id?: string | "";
  label: string;
  value: string;
  selected?: boolean;
};

export const CheckBoxInput = ({
  title,
  label,
  name,
  required,
  options,
  inline,
  onChange,
  colProps,
  ...rest
}: {
  title?: string;
  label?: string;
  name: string;
  required?: boolean | false;
  options: radioOptions[];
  inline?: boolean | false;
  onChange: (e: any) => void;
  colProps: ColProps
} & CustomInputProps) => {
  return (
    <>
      <Col sm="12">

        <Label className="mt-2">{title || label}</Label>
      </Col>
      {options.map(option =>
        <Col {...colProps} key={option.id}>
          <FormGroup className="mb-0">
            <CustomInput
              {...rest}
              id={`${option.id}`}
              name={name}
              value={option.value}
              label={option.label}
              inline={inline}
              onChange={onChange}
              defaultChecked={option.selected || false}
              required={required}
            />

          </FormGroup></Col>)}
    </>
  );
};

export const RadioInput = ({
  title,
  name,
  id,
  required,
  options,
  inline,
  onSelect,
  ...rest
}: {
  title?: string;
  name: string;
  id: any;
  required?: boolean | false;
  options: radioOptions[];
  inline?: boolean | false;
  onSelect: (e: any) => void;
} & CustomInputProps) => {
  return (
    <FormGroup className="mb-2">
      {title && <Label className="mt-2">{title}</Label>}
      <div>
        {options.map((option, key) => (
          <CustomInput
            {...rest}
            key={key}
            id={`${option.id + id}`}
            name={name}
            value={option.value}
            label={option.label}
            inline={inline}
            onChange={onSelect}
            defaultChecked={option.selected || false}
            required={required}
          />
        ))}
      </div>
    </FormGroup>
  );
};

export const CheckBoxes = ({
  title,
  required,
  options,
  inline,
  onSelect,
  type = "checkbox",
  ...rest
}: {
  title: string;
  required?: boolean | false;
  invalid?: boolean | false;
  options: radioOptions[];
  inline?: boolean | false;
  onSelect: (e: any) => void;
} & CustomInputProps) => {
  return (
    <FormGroup className="mb-2">
      <Label className="mt-2">{title}</Label>
      <div>
        {options.map((option, key) => (
          <CustomInput
            {...rest}
            className="mb-2"
            key={key}
            type={type}
            id={`${option.id}`}
            name={option.value}
            value={option.value}
            label={option.label}
            inline={inline}
            onChange={onSelect}
            defaultChecked={option.selected || false}
            required={required}
          />
        ))}
      </div>
    </FormGroup>
  );
};

export const SelectGroup = ({
  placeholder,
  name,
  options = [],
  onSelect,
  id = "",
  required = false,
  value = "",
  iconClass = "",
  disabled = false,
  label = "",
  defaultValue = "",
  ...rest
}: {
  value?: string | number;
  id?: string;
  invalid?: boolean | false;
  subText?: string;
  defaultValue?: string;
  placeholder: string;
  name: string;
  required?: boolean;
  options: {
    name: string;
    value: string | number;
    code?: string;
    title?: string;
    selected?: boolean;
  }[];
  onSelect: (e: any) => void;
  iconClass?: string;
  disabled?: boolean;
  label?: string;
  labelClass?: string;
}) => {
  return (
    <FormGroup className="mb-2">
      {!validator.isEmpty(label) ? (
        <label
          className={`mt-2 form-control-label ${rest.labelClass ? rest.labelClass : ""
            }`}
          htmlFor={name}
        >
          {required && <span className="text-danger">* </span>}
          {label}
        </label>
      ) : (
          <></>
        )}
      <InputGroup className="input-group-alternative">
        {!validator.isEmpty(iconClass) ? (
          <InputGroupAddon addonType="prepend">
            <InputGroupText>
              <i className={iconClass} />
            </InputGroupText>
          </InputGroupAddon>
        ) : (
            ""
          )}
        <CustomInput
          type="select"
          id={id}
          name={name}
          onChange={onSelect}
          required={required}
          disabled={disabled}
          {...rest}
        >
          <option
            value=""
            defaultValue=""
            disabled={value ? true : false}
          >
            {placeholder}
          </option>
          {options.map((item, key) => {
            if (item.title) item.name = item.title;

            return (
              <option
                defaultValue={item.name}
                key={key}
                value={item.value}
                selected={!!item.selected}
              >
                {item.name}
              </option>
            );
          })}
        </CustomInput>
      </InputGroup>
      {rest.subText && (
        <small
          className={`form-control-label ${rest.labelClass ? rest.labelClass : ""
            }`}
        >
          {rest.subText}
        </small>
      )}
    </FormGroup>
  );
};

