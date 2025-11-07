'use client'

import React, { useState, useEffect } from 'react'
import { Copy, Check, AlertCircle } from 'lucide-react'

interface CopyCodeBlockProps {
    children: React.ReactNode
    className?: string
    code?: string
}

export default function CopyCodeBlock({ children, className = '', code }: CopyCodeBlockProps) {
    const [copied, setCopied] = useState<'idle' | 'copied' | 'error'>('idle')
    const [codeContent, setCodeContent] = useState('')

    useEffect(() => {
        if (typeof children === 'string') {
            setCodeContent(children)
        } else if (code) {
            setCodeContent(code)
        } else {
            // Extraer texto de elementos React
            const textContent = React.Children.toArray(children)
                .map(child =>
                    typeof child === 'string' ? child :
                        typeof child === 'object' && child && 'props' in child && 'children' in child.props ?
                            (child.props.children as string) : ''
                )
                .join('')
            setCodeContent(textContent)
        }
    }, [children, code])

    const handleCopy = async () => {
        try {
            if (navigator.clipboard && codeContent) {
                await navigator.clipboard.writeText(codeContent.trim())
                setCopied('copied')
                setTimeout(() => setCopied('idle'), 2000)
            } else {
                // Fallback para navegadores sin soporte
                const textArea = document.createElement('textarea')
                textArea.value = codeContent.trim()
                document.body.appendChild(textArea)
                textArea.select()
                document.execCommand('copy')
                document.body.removeChild(textArea)
                setCopied('copied')
                setTimeout(() => setCopied('idle'), 2000)
            }
        } catch (err) {
            console.error('Error copying text: ', err)
            setCopied('error')
            setTimeout(() => setCopied('idle'), 2000)
        }
    }

    const getButtonText = () => {
        switch (copied) {
            case 'copied':
                return '✓ Copiado'
            case 'error':
                return '✗ Error'
            default:
                return 'Copiar'
        }
    }

    const getButtonIcon = () => {
        switch (copied) {
            case 'copied':
                return <Check className="w-3 h-3" />
            case 'error':
                return <AlertCircle className="w-3 h-3" />
            default:
                return <Copy className="w-3 h-3" />
        }
    }

    return (
        <div className={`relative group ${className}`}>
            <button
                onClick={handleCopy}
                className={`
          copy-button
          ${copied === 'copied' ? 'copied' : ''}
          ${copied === 'error' ? 'error' : ''}
        `}
                type="button"
                aria-label="Copiar código"
                title="Copiar código al portapapeles"
            >
                {getButtonIcon()}
                <span className="ml-1 hidden sm:inline">{getButtonText()}</span>
            </button>
            <div className="overflow-x-auto">
                {children}
            </div>
        </div>
    )
}
