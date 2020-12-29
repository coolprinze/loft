import React, { useState } from 'react'
import { Modal, ModalBody } from 'reactstrap'

const SuccessModal = ({ duration = 3, redirect, title = "Successful", subTitle = 'Your request has been succesfully submited' }: { duration?: number, redirect?: string, title?: string, subTitle?: string }) => {

  let [counter, setCounter] = useState(duration)
  const [show, setShow] = useState(true)


  let task = setInterval(() => {
    counter--
    counter > -1 ? setCounter(counter) : setShow(false)

  }, 1000)

  redirect && setTimeout(() => {
    clearInterval(task)
    window.location.href = redirect
  }, duration * 1000);

  return (
    <Modal
      isOpen={show}
      size="md" className="mt-5">
      <ModalBody className='my-5 py-5'>
        <div className="text-center">
          <i className="far fa-check-circle text-success fa-9x"></i>
        </div>
        <h1 style={{ fontSize: 40 }} className="text-center text-success">{title}</h1>
        <p className="text-center">{subTitle}</p>
        <h1 style={{ fontSize: 40 }} className="text-center">{counter}</h1>
      </ModalBody>
    </Modal>
  )
}

export default SuccessModal
