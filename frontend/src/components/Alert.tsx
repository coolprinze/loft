import React from 'react'
import { Alert as Alt } from 'reactstrap'

const Alert = ({ alert, color = 'danger', toggle }: { alert: boolean | string | string[], color?: string, toggle: () => void }) => {
  return (

    <Alt color={color} isOpen={!!alert} toggle={toggle} className='p-3'>
      {typeof alert === "object" ? <>
        <ul>
          {alert.map((err: string) => <li>{
            err.replace("_", " ")}</li>)}
        </ul>
      </> : alert}
    </Alt>
  )
}

export default Alert
