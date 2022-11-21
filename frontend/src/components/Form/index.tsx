import { useState } from 'react'
import Datetime from 'react-datetime'
import makeAnimated from 'react-select/animated'
import CreatableSelect from 'react-select/creatable'
import {
  Button,
  ButtonGroup,
  ButtonProps,
  Col,
  ColProps,
  FormGroup,
  Input,
  InputGroup,
  InputGroupText,
  InputProps,
  Label,
} from 'reactstrap'
import validator from 'validator'
import './style.css'
import TextValidator from './TextValidator'

const animatedComponents = makeAnimated()

export const TextInputGroup = ({
  iconClass = '',
  label = '',
  invalid = false,
  ...rest
}: { iconClass?: string; label?: string } & InputProps) => {
  return (
    <>
      {!validator.isEmpty(label) ? (
        <label className='form-control-label mt-2' htmlFor={rest.name}>
          {label}
          {rest.required && <span className='text-danger'>*</span>}
        </label>
      ) : (
        <></>
      )}
      <TextValidator invalid={invalid} value {...rest} />
      {rest.subText && <small>{rest.subText}</small>}
    </>
  )
}

export const FileInput = ({ iconClass = '', label = '', ...rest }) => {
  return (
    <FormGroup className='mb-2'>
      {!validator.isEmpty(label) ? (
        <label className='form-control-label mt-2' htmlFor={rest.name}>
          {label}
          {rest.required && <span className='text-danger'>*</span>}
        </label>
      ) : (
        <></>
      )}
      <InputGroup className='input-group-alternative'>
        {!validator.isEmpty(iconClass) ? (
          <InputGroupText>
            <i className={iconClass} />
          </InputGroupText>
        ) : (
          ''
        )}
        <Input
          addon={true}
          id={rest.name}
          pr
          type='file'
          {...rest}
          label={rest.customLabel ? rest.customLabel : 'Choose file'}
        />
      </InputGroup>
      {rest.subText && <small>{rest.subText}</small>}
    </FormGroup>
  )
}

export const DateInputGroup = ({
  onChange = (e: any) => {},
  iconClass = '',
  label = '',
  value = '',
  ...rest
}) => {
  return (
    <FormGroup className='mb-2'>
      {!validator.isEmpty(label) ? (
        <label className='form-control-label mt-2' htmlFor={rest.name}>
          {label}
          {rest.required && <span className='text-danger'>*</span>}
        </label>
      ) : (
        <></>
      )}
      <InputGroup className='input-group-alternative'>
        {!validator.isEmpty(iconClass) ? (
          <InputGroupText>
            <i className={iconClass} />
          </InputGroupText>
        ) : (
          ''
        )}
        <Datetime
          onChange={(e) =>
            //@ts-ignore
            onChange({ target: { name: rest.name, value: e._d } })
          }
          closeOnSelect
          timeFormat={false}
          value={value}
          {...{
            rest,
            inputProps: {
              ...rest.inputProps,
              style: { type: 'date' },
              required: rest.required,
              className: `form-control ${rest.invalid ? 'is-invalid' : ''}`,
            },
          }}
        />
      </InputGroup>
    </FormGroup>
  )
}

export type radioOptions = {
  id?: string
  label: string
  value: string | number
  selected?: boolean
}

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
  title?: string
  label?: string
  name: string
  required?: boolean | false
  options: radioOptions[]
  inline?: boolean | false
  onChange: (e: any) => void
  colProps: ColProps
} & InputProps) => {
  return (
    <>
      <Col sm='12'>
        <Label className='mt-2'>{title || label}</Label>
      </Col>
      {options.map((option) => (
        <Col {...colProps} key={option.id}>
          <FormGroup className='mb-0'>
            <Input
              addon={true}
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
          </FormGroup>
        </Col>
      ))}
    </>
  )
}

export const RadioInput = ({
  title,
  name,
  id = name,
  required,
  options: opts,
  inline,
  onSelect,
  ...rest
}: {
  title?: string
  name: string
  id?: any
  required?: boolean
  options: radioOptions[]
  inline?: boolean | false
  onSelect: (e: MouseEvent) => void
} & ButtonProps) => {
  const [options, setOptions] = useState(opts)

  const handleSelect = (e: MouseEvent) => {
    setOptions(
      opts.map((_) => ({
        ..._,
        // @ts-ignore
        selected: _.label === e.target.title ? true : false,
      }))
    )
    onSelect(e)
    return
  }

  return (
    <FormGroup className='mb-2'>
      {title && <Label className='mt-2 d-block mb-0'>{title}</Label>}
      <ButtonGroup>
        {options.map((option, key) => (
          <Button
            color='danger'
            outline
            // @ts-ignore
            onClick={handleSelect}
            // {...rest}
            key={key}
            id={`${id + key}`}
            name={name}
            value={option.value}
            title={option.label}
            inline={inline}
            active={option.selected || false}
            required={required}
          >
            {option.label}
          </Button>
        ))}
      </ButtonGroup>
    </FormGroup>
  )
}

export const CheckBoxes = ({
  title,
  required,
  options,
  inline,
  onSelect,
  type = 'checkbox',
  ...rest
}: {
  title: string
  required?: boolean | false
  invalid?: boolean | false
  options: radioOptions[]
  inline?: boolean | false
  onSelect: (e: any) => void
} & InputProps) => {
  return (
    <FormGroup className='mb-2'>
      <Label className='mt-2'>{title}</Label>
      <div>
        {options.map((option, key) => (
          <Input
            addon={true}
            {...rest}
            className='mb-2'
            key={key}
            type={type}
            id={`${option.id}`}
            name={rest.name}
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
  )
}

export const SelectGroup = ({
  placeholder,
  name,
  options = [],
  onSelect,
  id = '',
  required = false,
  value = '',
  iconClass = '',
  disabled = false,
  label = '',
  defaultValue = '',
  ...rest
}: {
  value?: string | number | null
  id?: string
  invalid?: boolean | false
  subText?: string
  defaultValue?: string
  placeholder: string
  name: string
  required?: boolean
  options: {
    name: string
    value: string | number
    code?: string
    title?: string
    selected?: boolean
    disabled?: boolean
  }[]
  onSelect: (e: any) => void
  iconClass?: string
  disabled?: boolean
  label?: string
  labelClass?: string
}) => {
  return (
    <FormGroup className='mb-2'>
      {!validator.isEmpty(label) ? (
        <label
          className={`mt-2 form-control-label ${
            rest.labelClass ? rest.labelClass : ''
          }`}
          htmlFor={name}
        >
          {label}
          {required && <span className='text-danger'>* </span>}
        </label>
      ) : (
        <></>
      )}
      <InputGroup className='input-group-alternative'>
        {!validator.isEmpty(iconClass) ? (
          <InputGroupText>
            <i className={iconClass} />
          </InputGroupText>
        ) : (
          ''
        )}
        <Input
          addon={true}
          type='select'
          id={id}
          name={name}
          onChange={onSelect}
          required={required}
          disabled={disabled}
          {...rest}
        >
          <option value='' defaultValue='' disabled={value ? true : false}>
            {placeholder}
          </option>
          {options.map((item, key) => {
            if (item.title) item.name = item.title

            return (
              <option
                defaultValue={item.name}
                key={key}
                value={item.value}
                selected={!!item.selected}
                disabled={!!item.disabled}
              >
                {item.name}
              </option>
            )
          })}
        </Input>
      </InputGroup>
      {rest.subText && (
        <small
          className={`form-control-label ${
            rest.labelClass ? rest.labelClass : ''
          }`}
        >
          {rest.subText}
        </small>
      )}
    </FormGroup>
  )
}

export const CustomSelectGroup = ({
  placeholder,
  options,
  onSelect,
  iconClass = '',
  label = '',
  isMulti = false,
  ...rest
}: {
  label?: string
  placeholder: string
  isMulti?: boolean
  options: any[]
  onSelect: (e: any) => void
  iconClass?: string
} & InputProps) => {
  console.log(options)

  return (
    <FormGroup className='mb-2'>
      {!validator.isEmpty(label) ? (
        <label className='form-control-label mt-2' htmlFor={rest.name}>
          {label}
          {rest.required && <span className='text-danger'>*</span>}
        </label>
      ) : (
        <></>
      )}
      <InputGroup className='input-group-alternative'>
        {!validator.isEmpty(iconClass) ? (
          <InputGroupText>
            <i className={iconClass} />
          </InputGroupText>
        ) : (
          ''
        )}

        <CreatableSelect
          onChange={onSelect}
          className='form-control h-auto p-0'
          components={animatedComponents}
          isMulti={isMulti}
          placeholder={placeholder}
          options={options}
          classNamePrefix='loft'
          styles={{ dropdownIndicator: (styles) => ({ display: 'none' }) }}
        />
      </InputGroup>
    </FormGroup>
  )
}

export const CustomSelect = ({
  iconClass = '',
  label = '',
  invalid = false,
  ...rest
}: { iconClass?: string; label?: string } & InputProps) => {
  // const [options, setOptions] = useState<string[]>([]),
  //   [inputValue, setInputValue] = useState('')

  // const
  // onInputChange = (val: string) => {
  //   const _inputArr = val.trim().split(',')
  //   if (_inputArr.length < 2) setInputValue(val)
  //   else {
  //     addOption('Hr')
  //     setInputValue(_inputArr[1])
  //   }
  // },
  // addOption = (opt: string) => setOptions([...options, opt])

  return (
    <>
      {!validator.isEmpty(label) ? (
        <label className='form-control-label mt-2' htmlFor={rest.name}>
          {label}
          {rest.required && <span className='text-danger'>*</span>}
        </label>
      ) : (
        ''
      )}

      <CreatableSelect
        options={[]}
        components={animatedComponents}
        isMulti
        isClearable
        // inputValue={inputValue}
        // onCreateOption={addOption}
        onChange={console.log}
        // onKeyDown={(e) => e.key == ',' ? setOptions([...options, ])}
      />
      {rest.subText && <small>{rest.subText}</small>}
    </>
  )
}
