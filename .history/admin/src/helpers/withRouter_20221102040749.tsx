import { useLocation, useNavigate, useParams } from 'react-router-dom'
import React, { PropsWithChildren } from 'react'

export default function withRouter(Component: React.Component) {
  function ComponentWithRouterProp(props: PropsWithChildren) {
    let location = useLocation()
    let navigate = useNavigate()
    let params = useParams()
    //@ts-ignore
    return <Component {...props} router={{ location, navigate, params }} />
  }

  return ComponentWithRouterProp
}
