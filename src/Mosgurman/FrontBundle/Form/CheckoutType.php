<?php

namespace Mosgurman\FrontBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class CheckoutType extends AbstractType
{
        /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('name', 'text', array(
                'label' => 'Ваше имя',
                'required' => false,
            ))
            ->add('surname', 'text', array(
                'label' => 'Фамилия',
                'required' => false,
            ))
            ->add('address', 'text', array(
                'label' => 'Адрес доставки',
                'required' => false,
            ))
            ->add('phone', 'text', array(
                'label' => 'Телефон',
                'required' => false,
            ))
            ->add('comment', 'textarea', array(
                'label' => 'Дополнительная информация',
                'required' => false,
            ))
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'Mosgurman\FrontBundle\Entity\Checkout'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'mosgurman_checkout';
    }
}
